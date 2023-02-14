/* Amplify Params - DO NOT EDIT
	API_HEALTHBACKEND_GRAPHQLAPIENDPOINTOUTPUT
	API_HEALTHBACKEND_GRAPHQLAPIIDOUTPUT
	API_HEALTHBACKEND_GRAPHQLAPIKEYOUTPUT
	ENV
	REGION
Amplify Params - DO NOT EDIT */ /*
Copyright 2017 - 2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at
    http://aws.amazon.com/apache2.0/
or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
*/

const express = require("express");
const bodyParser = require("body-parser");
const awsServerlessExpressMiddleware = require("aws-serverless-express/middleware");
const { getOrders } = require("./getOrders");
const {
    getOrdersResponse,
    orderStatusResponse,
} = require("./generateResponse");

// declare a new express app
const app = express();
app.use(bodyParser.json());
app.use(awsServerlessExpressMiddleware.eventContext());

// Enable CORS for all methods
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "*");
    next();
});

/**********************
 * Example get method *
 **********************/

app.get("/orders", async function (req, res) {
    // Add your code here
    // pageNumber=1&pageSize=5&orderIds=abc

    const queryParams = {
        pageNumber: req.query.pageNumber || 1,
        pageSize: req.query.pageSize || 50, //fixed req.query.pageNumber,
        orderItemIds: req.query.orderItemIds || null,
        orderDateFrom: req.query.orderDateFrom || null,
        orderDateTo: req.query.orderDateTo || null, //
        orderStatus: req.query.orderStatus || null, // Mandatory for getOrders
        orderIds: req.query.orderIds || null, //Mandatory for getOrders status only
    };

    // if (queryParams.orderIds) {
    //     // order status
    //     res.json({
    //         message: "order status!",
    //         // body: JSON.stringify(queryResponse.body),
    //     });
    // } else
    if (queryParams.orderStatus === "CREATED" || queryParams.orderIds) {
        // get orders
        // if (
        //    ( queryParams.orderStatus === "CREATED" &&
        //     queryParams.orderDateFrom &&
        //     queryParams.orderDateTo) || queryParams.orderIds
        // ) {
        let response = [];

        const queryResponse = await getOrders(queryParams);
        console.log(`🔥 ~ file: app.js:66 ~ queryResponse`, queryResponse);
        let listItems;
        // {
        //   "data": {
        //     "getOrder": {
        console.log(
            `🔥 ~ file: app.js:73 ~ queryParams.orderIds && queryResponse.body.data.getOrder`,
            queryParams.orderIds && queryResponse.body.data.getOrder
        );
        if (queryParams.orderIds && queryResponse.body.data.getOrder) {
            listItems = queryResponse.body.data.getOrder;
            console.log(`🔥 ~ file: app.js:74 ~ listItems`, listItems.length);
            // orderStatusResponse
            listItems && response.push(orderStatusResponse(listItems));
        } else if (queryParams.orderStatus === "CREATED") {
            listItems = queryResponse.body.data.listOrders.items;

            listItems &&
                listItems.length > 0 &&
                listItems.map((order) => {
                    response.push(getOrdersResponse(order));
                });
        }

        response = {
            data: response,
            nextToken: JSON.stringify(
                queryResponse.body.data?.listOrders?.nextToken || null
            ),
            // total: JSON.stringify(queryResponse.body.data.listOrders.total),
        };
        //

        console.log("🚀 ~ file: app.js:106 ~ response", response);

        if (queryResponse.statusCode === 200) {
            res.json(
                // body: JSON.stringify(queryResponse.body),
                //   statusCode: queryResponse.statusCode,
                //   total: JSON.stringify(queryResponse.body.data.searchProducts.total),
                response
            );
        } else {
            res.json({
                message: queryResponse.message,
                body: JSON.stringify(queryResponse.body),
            });
        }
        // }
    } else {
        res.json({
            message: "Invalid Parameters!",
            statusCode: 404,
            // body: JSON.stringify(queryResponse.body),
        });
    }
});

app.get("/orders/*", function (req, res) {
    // Add your code here
    res.json({ success: "get call succeed!", url: req.url });
});

/****************************
 * Example post method *
 ****************************/

app.post("/orders", function (req, res) {
    // Add your code here
    res.json({ success: "post call succeed!", url: req.url, body: req.body });
});

app.post("/orders/*", function (req, res) {
    // Add your code here
    res.json({ success: "post call succeed!", url: req.url, body: req.body });
});

/****************************
 * Example put method *
 ****************************/

app.put("/orders", function (req, res) {
    // Add your code here
    res.json({ success: "put call succeed!", url: req.url, body: req.body });
});

app.put("/orders/*", function (req, res) {
    // Add your code here
    res.json({ success: "put call succeed!", url: req.url, body: req.body });
});

/****************************
 * Example delete method *
 ****************************/

app.delete("/orders", function (req, res) {
    // Add your code here
    res.json({ success: "delete call succeed!", url: req.url });
});

app.delete("/orders/*", function (req, res) {
    // Add your code here
    res.json({ success: "delete call succeed!", url: req.url });
});

app.listen(3000, function () {
    console.log("App started");
});

// Export the app object. When executing the application local this does nothing. However,
// to port it to AWS Lambda we will create a wrapper around that will load the app from
// this file
module.exports = app;
