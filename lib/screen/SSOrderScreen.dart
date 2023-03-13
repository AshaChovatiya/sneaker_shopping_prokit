import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSDashBoardScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../../../main.dart';
import '../providers/order_confirmation_provider.dart';

class SSOrderScreen extends StatefulWidget {
  SSOrderScreen({
    required this.rzrPayPaymentId,
    required this.orderId,
  });

  String? orderId;
  String? rzrPayPaymentId;

  @override
  State<SSOrderScreen> createState() => _SSOrderScreenState();
}

class _SSOrderScreenState extends State<SSOrderScreen> {
/*  @override
  void initState() {
    super.initState();
    context.read<OrderConfirmationProvider>().validTransaction(
        rzrPaymentId: widget.rzrPayPaymentId, orderId: widget.orderId);
  }*/

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderConfirmationProvider()
        ..validTransaction(
            rzrPaymentId: widget.rzrPayPaymentId, orderId: widget.orderId),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Checkout", style: boldTextStyle()),
          leading: InkWell(
            onTap: () {
              SSDashBoardScreen().launch(context, isNewTask: true);
            },
            child:
                Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
          ),
        ),
        body: Consumer<OrderConfirmationProvider>(
          builder: (context, orderConfirmationProvider, child) {
            if (orderConfirmationProvider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (orderConfirmationProvider.isError) {
              return Center(
                  child: Text(orderConfirmationProvider.errorMessage,
                      style: boldTextStyle(color: Colors.red)));
            }
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.location_on,
                          color: Color(0xff808080), size: 24),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: appStore.isDarkModeOn
                                  ? context.iconColor
                                  : Color(0xff000000),
                              width: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: appStore.isDarkModeOn
                                  ? context.iconColor
                                  : Color(0xff000000),
                              width: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: appStore.isDarkModeOn
                                  ? context.iconColor
                                  : Color(0xff000000),
                              width: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: appStore.isDarkModeOn
                                  ? context.iconColor
                                  : Color(0xff000000),
                              width: 1),
                        ),
                      ),
                      Icon(Icons.credit_card,
                          color: Color(0xff808080), size: 24),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn
                              ? context.iconColor
                              : Color(0xff000000),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                      ),
                      Icon(Icons.verified, color: Color(0xff808080), size: 24),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(
                              "images/sneakerShopping/ic_shopping.png"),
                          height: 150,
                          width: 150,
                          color: appStore.isDarkModeOn
                              ? Colors.white
                              : Colors.black,
                          fit: BoxFit.cover),
                      SizedBox(height: 16),
                      Text("Order Success",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: boldTextStyle(size: 18)),
                      SizedBox(height: 16),
                      Text(
                          "Thank you for purchasing. Your order\n will be shipped in 2-3 working days",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: secondaryTextStyle()),
                    ],
                  ),
                  sSAppButton(
                    context: context,
                    title: 'Continue shopping',
                    onPressed: () {
                      SSDashBoardScreen().launch(context, isNewTask: true);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
