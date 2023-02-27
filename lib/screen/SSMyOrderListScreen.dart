import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';
import 'package:sneaker_shopping_prokit/store/AppStore.dart';

import '../providers/my_order_provider.dart';
import '../utils/SSConstants.dart';

class SSMyOrderListScreen extends StatelessWidget {
  const SSMyOrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        backgroundColor: appStore.appBarColor,
        title: Text(
          'My Order',
          style: TextStyle(
            color: appStore.textPrimaryColor,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => MyOrderProvider()..getShoppingCartList(),
        child: Consumer<MyOrderProvider>(
          builder: (context, myOrderProvider, child) {
            return myOrderProvider.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (myOrderProvider.myOrderModel!.listOrders!.items?.isEmpty ??
                            true) ||
                        (myOrderProvider.myOrderModel!.listOrders == null)
                    ? Center(
                        child: Text(
                          "No Data Found",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: appStore.isDarkModeOn
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: ListView.builder(
                            itemCount: myOrderProvider
                                .myOrderModel!.listOrders!.items?.length,
                            itemBuilder: (context, index) {
                              final orderItemList = myOrderProvider
                                  .myOrderModel!.listOrders!.items?[index];
                              return Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.white12,
                                                width: 1),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              imageUrl: orderItemList!
                                                          .products!
                                                          .productsItems![0]
                                                          .product
                                                          ?.thumbImages !=
                                                      null
                                                  ? imageBaseApi +
                                                      orderItemList
                                                          .products!
                                                          .productsItems![0]
                                                          .product!
                                                          .thumbImages!
                                                  : imagePlaceHolder,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16, width: 16),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                    orderItemList
                                                        .products!
                                                        .productsItems![0]
                                                        .product!
                                                        .title
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.clip,
                                                    style: boldTextStyle()),
                                                SizedBox(height: 4),
                                                Text(
                                                    orderItemList
                                                            .products!
                                                            .productsItems![0]
                                                            .product!
                                                            .additionalInfo ??
                                                        '',
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        secondaryTextStyle()),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${orderItemList.currency ?? ''}  ${orderItemList.products!.productsItems![0].product!.price.toString()}",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: boldTextStyle(
                                                          size: 14),
                                                    ),
                                                    SizedBox(width: 32),
                                                    Text(
                                                        'x ${orderItemList.products!.productsItems![0].quantity}',
                                                        style:
                                                            secondaryTextStyle(
                                                                size: 14)),
                                                    SizedBox(width: 5),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: getOrderStatusColor(
                                                                  orderItemList
                                                                      .status) ??
                                                              Colors.deepPurple,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        orderItemList.status ??
                                                            '',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color:
                                          AppStore().backgroundSecondaryColor,
                                    )
                                  ],
                                ),
                              );
                            }),
                      );
          },
        ),
      ),
    );
  }

  Color? getOrderStatusColor(String? orderStatus) {
    if (orderStatus == OrderStatus.ONHOLD.name) {
      return const Color(0x9eb03854);
    } else if (orderStatus == OrderStatus.PROCESSING.name) {
      return const Color(0xc2ff9e45);
    } else if (orderStatus == OrderStatus.CANCELLED.name) {
      return const Color(0x94ff0000);
    } else if (orderStatus == OrderStatus.CONFIRMED.name) {
      return const Color(0xbb75e36d);
    } else if (orderStatus == OrderStatus.DELIVERED.name) {
      return const Color(0xbb087500);
    } else if (orderStatus == OrderStatus.PENDING.name) {
      return const Color(0xc7a23500);
    }
    return const Color(0xc9f6e1df);
  }
}
