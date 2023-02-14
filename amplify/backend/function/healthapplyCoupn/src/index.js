/* Amplify Params - DO NOT EDIT
	API_HEALTHBACKEND_COUPONCODETABLE_ARN
	API_HEALTHBACKEND_COUPONCODETABLE_NAME
	API_HEALTHBACKEND_GRAPHQLAPIENDPOINTOUTPUT
	API_HEALTHBACKEND_GRAPHQLAPIIDOUTPUT
	API_HEALTHBACKEND_GRAPHQLAPIKEYOUTPUT
	ENV
	REGION
Amplify Params - DO NOT EDIT */
const AWS = require("aws-sdk");
const docClient = new AWS.DynamoDB.DocumentClient();

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
exports.handler = async (event) => {
    console.log(`EVENT: ${JSON.stringify(event)}`);

let coupons, expirationDate, totalUsed, discount, isActive, maxUse, isForAll, userID, id, code;

code=  event.arguments.code;
let  dateNow = new Date();
dateNow= dateNow.toISOString(),
console.log("code",code);
    if (!event.request.headers.authorization) {

         coupons = await getCouponsbyCode(code);
        console.log("coupons data", coupons);
        
    }
    else{
        userID= event.identity?.claims?.sub;
        console.log("userID",userID);

         coupons = await getCouponsbyUserID(userID, code);
        console.log("getCouponsbyUserID data", coupons);
        
        
    }
    console.log("coupons?.Count", coupons?.Count);
    if(coupons?.Count>0){
         expirationDate=coupons.Items[0].expirationDate;
         totalUsed=coupons.Items[0].totalUsed;
         discount=coupons.Items[0].discount;
         isActive=coupons.Items[0].isActive;
         maxUse=coupons.Items[0].maxUse;
         code=coupons.Items[0].code;
         isForAll=coupons.Items[0].isForAll;
         id=coupons.Items[0].id;
         
         if(expirationDate>dateNow &&maxUse>totalUsed && isActive== true){
         
         return {
            statusCode: 200,
            code : code,
            discount: discount,
            expirationDate: expirationDate,
            id: id,
            isActive: isActive,
            isForAll: isForAll,
            maxUse: maxUse,
            totalUsed: totalUsed,
            userId: userID
            };
        
        }else{
             return {
            statusCode: 400,
            message: "Invalid Coupon Code"
            
            }
        }
    }else{
         return {
        statusCode: 400,
        message: "Invalid Coupon Code"
        
        }
    }



};


async function getCouponsbyUserID(userID, code) {
    try {
        var params = {
            TableName: process.env.API_HEALTHBACKEND_COUPONCODETABLE_NAME,
            IndexName: "bycodeUserIdCouponCode",
            KeyConditionExpression: "code = :v1 and userId = :v2",
            ScanIndexForward: false,
            ExpressionAttributeValues: {
                ":v1": code,
                ":v2": userID,
            },
        };
        const data = await docClient.query(params).promise();
        return data;
    } catch (err) {
        console.log("getCouponsbyUserID failed catch", err.message);

        return err;
    }
}


async function getCouponsbyCode(code) {
    try {
        var params = {
            TableName: process.env.API_HEALTHBACKEND_COUPONCODETABLE_NAME,
            IndexName: "bycodeisForAllCouponCode",
            KeyConditionExpression: "code = :v1 and isForAll = :v2",
            ScanIndexForward: false,
            ExpressionAttributeValues: {
                ":v1": code,
                ":v2": 1,
            },
        };
        const data = await docClient.query(params).promise();
        return data;
    } catch (err) {
        console.log("getCouponsbyCode failed catch", err.message);

        return err;
    }
}
