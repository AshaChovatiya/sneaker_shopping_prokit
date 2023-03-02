import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/checkout_provider.dart';
import 'package:sneaker_shopping_prokit/providers/payment_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSOrderScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../model/order_response_model.dart';

class SSPaymentScreen extends StatefulWidget {
  SSPaymentScreen(
      {Key? key, required this.isOrderScreen, this.orderResponseData,this.currency})
      : super(key: key);
  final bool isOrderScreen;
  final String? currency;
  final OrderResponseData? orderResponseData;

  @override
  State<SSPaymentScreen> createState() => _SSPaymentScreenState();
}

class _SSPaymentScreenState extends State<SSPaymentScreen> {
  List<SneakerShoppingModel> payment = paymentList();
  int mCount = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        if (!widget.isOrderScreen)
          ChangeNotifierProvider(
              create: (_) => PaymentProvider(
                  orderResponseData:
                      context.read<CheckOutProvider>().orderResponseData!))
        else
          ChangeNotifierProvider(
              create: (_) =>
                  PaymentProvider(orderResponseData: widget.orderResponseData!))
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Checkout", style: boldTextStyle()),
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child:
                Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.location_on, color: Color(0xff808080), size: 24),
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
                  Icon(Icons.credit_card, color: Color(0xff808080), size: 24),
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0x1f000000),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0x1f000000),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0x1f000000),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0x1f000000),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Icon(Icons.verified, color: Color(0xff808080), size: 24),
                ],
              ),
              SizedBox(height: 32, width: 16),
              Text("Payment Option",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: boldTextStyle()),
              SizedBox(height: 16, width: 16),
              ListView.builder(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                shrinkWrap: true,
                itemCount: payment.length,
                itemBuilder: (_, index) {
                  return Consumer<PaymentProvider>(
                      builder: (context, paymentProvider, child) {
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if (index == 2) {
                          paymentProvider.paymentMethod = PaymentMethods.COD;
                        } else {
                          paymentProvider.paymentMethod = PaymentMethods.ONLINE;
                        }
                        setState(() {
                          mCount = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: mCount == index
                                  ? context.iconColor
                                  : Colors.grey.withOpacity(0.3),
                              width: 1),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: mCount == index
                                      ? context.iconColor
                                      : Colors.grey.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                payment[index].name!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: boldTextStyle(
                                    color: mCount == index
                                        ? context.iconColor
                                        : Colors.grey.withOpacity(0.5)),
                              ),
                              Image(
                                  image: AssetImage(payment[index].img!),
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
              )
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: context.cardColor,
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: widget.isOrderScreen ?Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Sub - total', style: secondaryTextStyle()),
                  ),
                  Text(
                      '${widget.currency ?? ''} ${widget.orderResponseData?.createOrder?.totalAmount ?? 0}',
                      style: boldTextStyle()),
                ],
              ),
              SizedBox(height: 16),
              Divider(color: Colors.grey, height: 1),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping fee', style: secondaryTextStyle()),
                  Text(
                      '${widget.currency ?? ''} ${widget.orderResponseData?.createOrder?.totalShippingCharges ?? 0}',
                      style: boldTextStyle()),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Payment', style: primaryTextStyle()),
                  Text(
                      '${widget.currency ?? ''} ${(widget.orderResponseData?.createOrder?.totalShippingCharges ?? 0) + (widget.orderResponseData?.createOrder?.totalAmount ?? 0)}',
                      style: boldTextStyle()),
                ],
              ),
              SizedBox(height: 16),
              Consumer<PaymentProvider>(
                  builder: (context, paymentProvider, child) {
                    return paymentProvider.isPaymentLoading
                        ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            context.iconColor),
                      ),
                    )
                        : sSAppButton(
                      context: context,
                      title: 'Place Order',
                      onPressed: () async {
                        await paymentProvider.pay();
                        if (!paymentProvider.isError) {
                          SSOrderScreen().launch(context);
                        }

                        //SSOrderScreen().launch(context);
                      },
                    );
                  }),
            ],
          ):Consumer<CheckOutProvider>(
              builder: (context, checkoutProvider, child) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Sub - total', style: secondaryTextStyle()),
                    ),
                    Text(
                        '${checkoutProvider.currencySymbol} ${checkoutProvider.orderResponseData?.createOrder?.totalAmount ?? 0}',
                        style: boldTextStyle()),
                  ],
                ),
                SizedBox(height: 16),
                Divider(color: Colors.grey, height: 1),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping fee', style: secondaryTextStyle()),
                    Text(
                        '${checkoutProvider.currencySymbol} ${checkoutProvider.orderResponseData?.createOrder?.totalShippingCharges ?? 0}',
                        style: boldTextStyle()),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Payment', style: primaryTextStyle()),
                    Text(
                        '${checkoutProvider.currencySymbol} ${(checkoutProvider.orderResponseData?.createOrder?.totalShippingCharges ?? 0) + (checkoutProvider.orderResponseData?.createOrder?.totalAmount ?? 0)}',
                        style: boldTextStyle()),
                  ],
                ),
                SizedBox(height: 16),
                Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                  return paymentProvider.isPaymentLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                context.iconColor),
                          ),
                        )
                      : sSAppButton(
                          context: context,
                          title: 'Place Order',
                          onPressed: () async {
                            await paymentProvider.pay();
                            if (!paymentProvider.isError) {
                              SSOrderScreen().launch(context);
                            }

                            //SSOrderScreen().launch(context);
                          },
                        );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
