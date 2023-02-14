const GRAPHQL_ENDPOINT = process.env.API_HEALTHBACKEND_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_HEALTHBACKEND_GRAPHQLAPIKEYOUTPUT;
const fetch = require("node-fetch");
const Request = fetch.Request;

const { getOrder, listOrders } = require("./graphql.js"); // graphql.js exports the GraphQL query
// const { sendResponse } = require('./generateResponse.js');

const getOrders = async (queryParams) => {
    console.log(
        `🔥 ~ file: getOrders.js:10 ~ getOrders ~ queryParams`,
        queryParams
    );

    let statusCode = 200;
    let message = "Something Wrong";
    let body;
    let response;
    let variables;

    if (queryParams?.orderIds) {
        variables = {
            id: queryParams?.orderIds,
        };
    } else if (queryParams.orderStatus === "CREATED") {
        variables: {
        }
    }
    const options = {
        method: "POST",
        headers: {
            "x-api-key": GRAPHQL_API_KEY,
        },
        body: JSON.stringify({
            query: queryParams?.orderIds ? getOrder : listOrders,
            variables: variables,
            //    {
            //     //   filter: {
            //     //     publishedAt: {
            //     //       exists: publishedStatus,
            //     //     },
            //     //   },
            //   },
        }),
    };
    console.log(`🔥 ~ file: getOrders.js:46 ~ getOrders ~ options`, options)

    const request = new Request(GRAPHQL_ENDPOINT, options);

    try {
        response = await fetch(request);
        body = await response.json();

        if (body.errors) statusCode = 400;
    } catch (error) {
        statusCode = 400;
        (message = error.message),
            (body = {
                errors: [
                    {
                        status: response.status,
                        // message: error.message,
                        stack: error.stack,
                    },
                ],
            });
    }
    return {
        statusCode,
        body,
        message,
    };
};

module.exports = {
    getOrders,
};

// pageSize=50                                      mandatory  Yes	Fixed: 50
// pageNumber=1                                     mandatory: Yes	Default: 1
// orderStatus=CREATED                              Yes	Fixed: CREATED

// &orderDateFrom=2021-09-22T16:13:44+05:30
// &orderDateTo=2021-12-21T16:13:44+05:30&
// orderIds	string	Order ID’s	-	-
// orderItemIds	string	Item ID’s	-	-
