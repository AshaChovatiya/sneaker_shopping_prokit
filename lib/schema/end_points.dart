// import 'package:flutter/cupertino.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:simple_gql/simple_gql.dart';
//
// import '../config/storage_service.dart';
//
// String endPoint = "https://api.travellia.in/graphql/";
// var token = Pref.getToken();
//
// class EndPoints {
//   GQLClient gQLClient() {
//     var userToken = Pref.getToken();
//     var client = GQLClient(endPoint, headers: {
//       'Content-Type': 'application/json',
//       'authorization': "Bearer $userToken",
//     });
//     print(client.headers);
//     return client;
//   }
//
//   var client = GQLClient(endPoint, headers: {
//     'Content-Type': 'application/json',
//     'authorization': "Bearer $token",
//   });
//
//   ValueNotifier<GraphQLClient> getClient() {
//     ValueNotifier<GraphQLClient> _client = ValueNotifier(
//       GraphQLClient(
//         cache: GraphQLCache(store: HiveStore()),
//         link: HttpLink(endPoint),
//       ),
//     );
//     return _client;
//   }
//
//   ValueNotifier<GraphQLClient> sendClient() {
//     ValueNotifier<GraphQLClient> _client = ValueNotifier(
//       GraphQLClient(
//         cache: GraphQLCache(store: HiveStore()),
//         link: HttpLink(endPoint, defaultHeaders: {
//           'Authorization':
//               'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6NCwiZXhwIjoxNjQ2MDY4Mzg5LCJvcmlnSWF0IjoxNjQ2MDY4MDg5fQ.4pg3gE4gsKgCgpgPbRAhSvKYPRX9_C30uX_DKQP1lA8',
//           'Content-Type': 'application/json',
//         }),
//       ),
//     );
//     return _client;
//   }
// }
