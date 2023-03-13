import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/checkout_provider.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSPaymentScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

class SSBillingAddressScreen extends StatelessWidget {
  final String? shoppingCartId;
  final String? productId;
  final String? sku;
  final String? title;
  final int? qty;
  final double? price;

  SSBillingAddressScreen(
      {Key? key,
      this.shoppingCartId,
      this.price,
      this.productId,
      this.qty,
      this.sku,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckOutProvider()
        ..getUserData()
        ..setLocationData(),
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
                      DropdownButtonFormField(
                        value: checkOutProvider.billingStateController.text,
                        hint: Text('Select State'),
                        items: checkOutProvider.states
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e.name ?? ''),
                                  value: e.value,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          checkOutProvider.billingStateController.text = value!;
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Country",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle(),
                      ),
                      DropdownButtonFormField(
                        value: checkOutProvider.billingCountryController.text,
                        hint: Text('Select Country'),
                        items: checkOutProvider.countries
                            .map((e) => DropdownMenuItem<String>(
                                  child: Text(e.name ?? ''),
                                  value: e.value,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          checkOutProvider.billingCountryController.text =
                              value ?? '';
                        },
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
                        keyboardType: TextInputType.phone,
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
                          hintText: "+91xxxxxxxxxx",
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
                          hintText: "xyz@example.com",
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
                              keyboardType: TextInputType.phone,
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
                                hintText: "+91xxxxxxxxxx",
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
                                hintText: "xyz@example.com",
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
                      if (checkOutProvider.billingFullNameController.text.isNotEmpty &&
                          checkOutProvider
                              .billingAddressController.text.isNotEmpty &&
                          checkOutProvider
                              .billingCityController.text.isNotEmpty &&
                          checkOutProvider
                              .billingStateController.text.isNotEmpty &&
                          checkOutProvider
                              .billingPostCodeController.text.isNotEmpty &&
                          checkOutProvider
                              .billingCountryController.text.isNotEmpty &&
                          checkOutProvider
                              .billingPhoneController.text.isNotEmpty &&
                          checkOutProvider
                              .billingEmailController.text.isNotEmpty) {
                        if (!checkOutProvider.setAsDefaultBillingAddress) {
                          if (!checkOutProvider
                                  .shippingFullNameController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingEmailController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingPhoneController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingAddressController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingCityController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingCountryController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingStateController.text.isNotEmpty &&
                              checkOutProvider
                                  .shippingPostCodeController.text.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChangeNotifierProvider.value(
                                    value: checkOutProvider,
                                    child: SSPaymentScreen(
                                      sku: sku,
                                      title: title,
                                      shoppingCartId: shoppingCartId,
                                      price: price,
                                      productId: productId,
                                      qty: qty,
                                      couponCodeItemId: context
                                          .read<ShoppingCartProvider>()
                                          .selectedCouponCodeItem
                                          ?.id,
                                      shippingAmount: 0,
                                      totalAmount: context
                                          .read<ShoppingCartProvider>()
                                          .totalPrice,
                                    ),
                                  ),
                                ));
                          } else {
                            GlobalSnackBar.show(
                                context: context,
                                message: 'Please fill shipping address');
                          }
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChangeNotifierProvider.value(
                                  value: checkOutProvider,
                                  child: SSPaymentScreen(
                                    sku: sku,
                                    title: title,
                                    shoppingCartId: shoppingCartId,
                                    price: price,
                                    productId: productId,
                                    qty: qty,
                                    couponCodeItemId: context
                                        .read<ShoppingCartProvider>()
                                        .selectedCouponCodeItem
                                        ?.id,
                                    shippingAmount: 0,
                                    totalAmount: context
                                        .read<ShoppingCartProvider>()
                                        .totalPrice,
                                  ),
                                ),
                              ));
                        }
                      } else {
                        GlobalSnackBar.show(
                            context: context,
                            message: 'Please fill billing address');
                      }
                    },
                  ),
          );
        }),
      ),
    );
  }
}
