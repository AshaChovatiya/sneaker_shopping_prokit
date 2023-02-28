import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/checkout_provider.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSPaymentScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import '../model/shoppingCartList_model.dart';

class SSBillingAddressScreen extends StatelessWidget {
  final String? shoppingCartId;
  final String? productId;
  final int? qty;
  final double? price;

  SSBillingAddressScreen(
      {Key? key, this.shoppingCartId, this.price, this.productId, this.qty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckOutProvider()..getUserData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Checkout", style: boldTextStyle()),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
          ),
        ),
        body:
            Consumer<CheckOutProvider>(builder: (context, checkOutProvider, _) {
          return checkOutProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(16),
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
                          Icon(Icons.location_on,
                              color: Color(0xff808080), size: 24),
                          Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Color(0x1f000000),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              color: Color(0x1f000000),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
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
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1),
                            ),
                          ),
                          Icon(Icons.verified,
                              color: Color(0xff808080), size: 24),
                        ],
                      ),
                      SizedBox(height: 32),
                      Text(
                        "Billing Address",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Full Name",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      TextField(
                        controller: checkOutProvider.billingFullNameController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "Jason Anderson",
                          hintStyle: boldTextStyle(
                              size: 14, color: Colors.grey.withOpacity(0.5)),
                          filled: true,
                          fillColor: Color(0x00f2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                      SizedBox(height: 16, width: 16),
                      Text(
                        "Address",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      TextField(
                        controller: checkOutProvider.billingAddressController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "503, Antom Street",
                          hintStyle: boldTextStyle(
                              size: 14, color: Colors.grey.withOpacity(0.5)),
                          filled: true,
                          fillColor: Color(0x00f2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                      SizedBox(height: 16, width: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "City",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: secondaryTextStyle(),
                                ),
                                TextField(
                                  controller:
                                      checkOutProvider.billingCityController,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                  ),
                                  decoration: InputDecoration(
                                    disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    hintText: "Sabah",
                                    hintStyle: boldTextStyle(
                                        size: 14,
                                        color: Colors.grey.withOpacity(0.5)),
                                    filled: true,
                                    fillColor: Color(0x00f2f2f3),
                                    isDense: false,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 8, 12, 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Postcode",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: secondaryTextStyle(),
                                ),
                                TextField(
                                  controller: checkOutProvider
                                      .billingPostCodeController,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                  ),
                                  decoration: InputDecoration(
                                    disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          color: Color(0xff000000), width: 1),
                                    ),
                                    hintText: "88300",
                                    hintStyle: boldTextStyle(
                                        size: 14,
                                        color: Colors.grey.withOpacity(0.5)),
                                    filled: true,
                                    fillColor: Color(0x07f2f2f3),
                                    isDense: false,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 8, 12, 8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "State",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      TextField(
                        controller: checkOutProvider.billingStateController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "Gujarat",
                          hintStyle: boldTextStyle(
                              size: 14, color: Colors.grey.withOpacity(0.5)),
                          filled: true,
                          fillColor: Color(0x00f2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Country",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      TextField(
                        controller: checkOutProvider.billingCountryController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "India",
                          hintStyle: boldTextStyle(
                              size: 14, color: Colors.grey.withOpacity(0.5)),
                          filled: true,
                          fillColor: Color(0x00f2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Phone No.",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      TextField(
                        controller: checkOutProvider.billingPhoneController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "India",
                          hintStyle: boldTextStyle(
                              size: 14, color: Colors.grey.withOpacity(0.5)),
                          filled: true,
                          fillColor: Color(0x00f2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Email",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      TextField(
                        controller: checkOutProvider.billingEmailController,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "India",
                          hintStyle: boldTextStyle(
                              size: 14, color: Colors.grey.withOpacity(0.5)),
                          filled: true,
                          fillColor: Color(0x00f2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                      SizedBox(height: 16),
                      if (!checkOutProvider.setAsDefaultBillingAddress)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Text(
                              "Shipping Address",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Full Name",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            TextField(
                              controller:
                                  checkOutProvider.shippingFullNameController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                hintText: "Jason Anderson",
                                hintStyle: boldTextStyle(
                                    size: 14,
                                    color: Colors.grey.withOpacity(0.5)),
                                filled: true,
                                fillColor: Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 12, 8),
                              ),
                            ),
                            SizedBox(height: 16, width: 16),
                            Text(
                              "Address",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            TextField(
                              controller:
                                  checkOutProvider.shippingAddressController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                hintText: "503, Antom Street",
                                hintStyle: boldTextStyle(
                                    size: 14,
                                    color: Colors.grey.withOpacity(0.5)),
                                filled: true,
                                fillColor: Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 12, 8),
                              ),
                            ),
                            SizedBox(height: 16, width: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "City",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: secondaryTextStyle(),
                                      ),
                                      TextField(
                                        controller: checkOutProvider
                                            .shippingCityController,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: InputDecoration(
                                          disabledBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: BorderSide(
                                                color: Color(0xff000000),
                                                width: 1),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: BorderSide(
                                                color: Color(0xff000000),
                                                width: 1),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: BorderSide(
                                                color: Color(0xff000000),
                                                width: 1),
                                          ),
                                          hintText: "Sabah",
                                          hintStyle: boldTextStyle(
                                              size: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          filled: true,
                                          fillColor: Color(0x00f2f2f3),
                                          isDense: false,
                                          contentPadding:
                                              EdgeInsets.fromLTRB(12, 8, 12, 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Postcode",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: secondaryTextStyle(),
                                      ),
                                      TextField(
                                        controller: checkOutProvider
                                            .shippingPostCodeController,
                                        obscureText: false,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                        ),
                                        decoration: InputDecoration(
                                          disabledBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: BorderSide(
                                                color: Color(0xff000000),
                                                width: 1),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: BorderSide(
                                                color: Color(0xff000000),
                                                width: 1),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            borderSide: BorderSide(
                                                color: Color(0xff000000),
                                                width: 1),
                                          ),
                                          hintText: "88300",
                                          hintStyle: boldTextStyle(
                                              size: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.5)),
                                          filled: true,
                                          fillColor: Color(0x07f2f2f3),
                                          isDense: false,
                                          contentPadding:
                                              EdgeInsets.fromLTRB(12, 8, 12, 8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              "State",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            TextField(
                              controller:
                                  checkOutProvider.shippingStateController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                hintText: "Gujarat",
                                hintStyle: boldTextStyle(
                                    size: 14,
                                    color: Colors.grey.withOpacity(0.5)),
                                filled: true,
                                fillColor: Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 12, 8),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Country",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            TextField(
                              controller:
                                  checkOutProvider.shippingCountryController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                hintText: "India",
                                hintStyle: boldTextStyle(
                                    size: 14,
                                    color: Colors.grey.withOpacity(0.5)),
                                filled: true,
                                fillColor: Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 12, 8),
                              ),
                            ),
                            Text(
                              "Phone No.",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            TextField(
                              controller:
                                  checkOutProvider.shippingPhoneController,
                              obscureText: false,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                hintText: "India",
                                hintStyle: boldTextStyle(
                                    size: 14,
                                    color: Colors.grey.withOpacity(0.5)),
                                filled: true,
                                fillColor: Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 12, 8),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Email",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle(),
                            ),
                            TextField(
                              controller:
                                  checkOutProvider.shippingEmailController,
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                      color: Color(0xff000000), width: 1),
                                ),
                                hintText: "India",
                                hintStyle: boldTextStyle(
                                    size: 14,
                                    color: Colors.grey.withOpacity(0.5)),
                                filled: true,
                                fillColor: Color(0x00f2f2f3),
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 12, 8),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      SizedBox(height: 16),
                      Theme(
                        data: ThemeData(
                            unselectedWidgetColor: appStore.isDarkModeOn
                                ? Colors.white
                                : Colors.black),
                        child: CheckboxListTile(
                          checkColor: appStore.isDarkModeOn
                              ? Colors.black
                              : Colors.white,
                          activeColor: appStore.isDarkModeOn
                              ? Colors.white
                              : Colors.black,
                          value: checkOutProvider.setAsDefaultBillingAddress,
                          title: Text('Save as default billing address',
                              style: primaryTextStyle()),
                          onChanged: (bool? val) {
                            checkOutProvider.setAsDefaultBillingAddress = val!;
                          },
                        ),
                      ),
                    ],
                  ),
                );
        }),
        bottomNavigationBar:
            Consumer<CheckOutProvider>(builder: (context, checkOutProvider, _) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: checkOutProvider.isOrdering
                ? Container(
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  )
                : sSAppButton(
                    context: context,
                    title: 'Continue to payment',
                    onPressed: () async {
                      final userId = await Amplify.Auth.getCurrentUser()
                          .then((value) => value.userId);
                      var createOrderData = {
                        'status': OrderStatus.PROCESSING.name,
                        'currency': "inr",
                        'userId': userId,
                        'totalStoreCredit': 0.0,
                        'totalDiscount': 0.0,
                        'totalAmount': price,
                        'totalCashOnDeliveryCharges': 0.0,
                        'orderDate': '${TemporalDateTime.now()}',
                        'CouponCodeId': context
                                    .read<ShoppingCartProvider>()
                                    .selectedCouponCodeItem !=
                                null
                            ? context
                                .read<ShoppingCartProvider>()
                                .selectedCouponCodeItem!
                                .id
                            : '',
                        'BillingAddress': {
                          'name':
                              checkOutProvider.billingFullNameController.text,
                          'address':
                              checkOutProvider.billingAddressController.text,
                          'country':
                              checkOutProvider.billingCountryController.text,
                          'city': checkOutProvider.billingCityController.text,
                          'pinCode':
                              checkOutProvider.billingPostCodeController.text,
                          'state': checkOutProvider.billingStateController.text,
                          'phone': checkOutProvider.billingPhoneController.text,
                          'email': checkOutProvider.billingEmailController.text,
                        },
                        'shippingAddress': {
                          'address': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingStateController.text
                              : checkOutProvider.shippingAddressController.text,
                          'city': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingCityController.text
                              : checkOutProvider.shippingCityController.text,
                          'country': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingCountryController.text
                              : checkOutProvider.shippingCountryController.text,
                          'name': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingFullNameController.text
                              : checkOutProvider
                                  .shippingFullNameController.text,
                          'pinCode': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingPostCodeController.text
                              : checkOutProvider
                                  .shippingPostCodeController.text,
                          'state': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingStateController.text
                              : checkOutProvider.shippingStateController.text,
                          'phone': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingPhoneController.text
                              : checkOutProvider.shippingPhoneController.text,
                          'email': checkOutProvider.setAsDefaultBillingAddress
                              ? checkOutProvider.billingEmailController.text
                              : checkOutProvider.shippingEmailController.text,
                        },
                        'totalShippingCharges': 0.0
                      };
                      await checkOutProvider.createOrderCart(
                          data: createOrderData,
                          productId: productId!,
                          productPrice: price!,
                          quantity: qty!);
                      if (!checkOutProvider.isError) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider.value(
                                value: checkOutProvider,
                                child: SSPaymentScreen(
                                  shoppingCartId: shoppingCartId,
                                ),
                              ),
                            ));
                      }
                    },
                  ),
          );
        }),
      ),
    );
  }
}
