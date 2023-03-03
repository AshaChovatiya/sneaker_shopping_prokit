import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/checkout_provider.dart';
import 'package:sneaker_shopping_prokit/providers/payment_provider.dart';
import 'package:sneaker_shopping_prokit/providers/product_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSOrderScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

class SSPaymentScreen extends StatefulWidget {
  final String? shoppingCartId;
  final String? productId;
  final int? qty;
  final double? price;
  final String? title;
  final String? sku;

  final String? couponCodeItemId;
  final double? totalAmount;
  final double? shippingAmount;

  SSPaymentScreen(
      {Key? key,
      this.shoppingCartId,
      this.productId,
      this.price,
      this.qty,
      this.couponCodeItemId,
      this.totalAmount,
      this.shippingAmount,
      this.title,
      this.sku})
      : super(key: key);

  @override
  State<SSPaymentScreen> createState() => _SSPaymentScreenState();
}

class _SSPaymentScreenState extends State<SSPaymentScreen> {
  List<SneakerShoppingModel> payment = paymentList();
  int mCount = 0;
  @override
  Widget build(BuildContext context) {
    final checkOutProvider = context.watch<CheckOutProvider>();
    return ChangeNotifierProvider(
      create: (context) => PaymentProvider(
          shoppingCartId: widget.shoppingCartId,
          userData: context.read<CheckOutProvider>().userData,
          context: context)
        ..initPayment(),
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
                          paymentProvider.paymentMethod =
                              PaymentMethods.PREPAID;
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
          child: Consumer<CheckOutProvider>(
              builder: (context, checkoutProvider, child) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Sub - total', style: secondaryTextStyle()),
                    ),
                    Text(
                        '${checkoutProvider.currencySymbol} ${widget.totalAmount ?? 0}',
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
                        '${checkoutProvider.currencySymbol} ${widget.shippingAmount ?? 0}',
                        style: boldTextStyle()),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Payment', style: primaryTextStyle()),
                    Text(
                        '${checkoutProvider.currencySymbol} ${(widget.shippingAmount ?? 0) + (widget.totalAmount ?? 0)}',
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
                            final userId = await Amplify.Auth.getCurrentUser()
                                .then((value) => value.userId);
                            var createOrderData = {
                              'paymentType': paymentProvider.paymentMethod.name,
                              'status': OrderStatus.CONFIRMED.name,
                              'currency': 'INR',
                              'sku': '${widget.sku}',
                              'title': '${widget.title}',
                              'sla': '${TemporalDateTime.now()}',
                              'userId': userId,
                              'totalStoreCredit': 0.0,
                              'totalDiscount': 0.0,
                              'totalAmount': widget.price,
                              'totalCashOnDeliveryCharges': 0.0,
                              'orderDate': '${TemporalDateTime.now()}',
                              'CouponCodeId': widget.couponCodeItemId ?? '',
                              'BillingAddress': {
                                'name': checkOutProvider
                                    .billingFullNameController.text,
                                'address': checkOutProvider
                                    .billingAddressController.text,
                                'country': checkOutProvider
                                    .billingCountryController.text,
                                'city':
                                    checkOutProvider.billingCityController.text,
                                'pinCode': checkOutProvider
                                    .billingPostCodeController.text,
                                'state': checkOutProvider
                                    .billingStateController.text,
                                'phone': '+91' +
                                    checkOutProvider
                                        .billingPhoneController.text,
                                'email': checkOutProvider
                                    .billingEmailController.text,
                              },
                              'shippingAddress': {
                                'address':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingStateController.text
                                        : checkOutProvider
                                            .shippingAddressController.text,
                                'city':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingCityController.text
                                        : checkOutProvider
                                            .shippingCityController.text,
                                'country':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingCountryController.text
                                        : checkOutProvider
                                            .shippingCountryController.text,
                                'name':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingFullNameController.text
                                        : checkOutProvider
                                            .shippingFullNameController.text,
                                'pinCode':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingPostCodeController.text
                                        : checkOutProvider
                                            .shippingPostCodeController.text,
                                'state':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingStateController.text
                                        : checkOutProvider
                                            .shippingStateController.text,
                                'phone':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? '+91' +
                                            checkOutProvider
                                                .billingPhoneController.text
                                        : '+91' +
                                            checkOutProvider
                                                .shippingPhoneController.text,
                                'email':
                                    checkOutProvider.setAsDefaultBillingAddress
                                        ? checkOutProvider
                                            .billingEmailController.text
                                        : checkOutProvider
                                            .shippingEmailController.text,
                              },
                              'totalShippingCharges': 0.0
                            };
                            await checkOutProvider.createOrderCart(
                                data: createOrderData,
                                productId: widget.productId!,
                                productPrice: widget.price!,
                                quantity: widget.qty!);

                            paymentProvider.orderResponseData =
                                checkOutProvider.orderResponseData;

                            if (paymentProvider.orderResponseData == null) {
                              GlobalSnackBar.show(
                                  context: context,
                                  message:
                                      'Something went wrong with your order');
                              return;
                            }

                            await paymentProvider.pay();

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
