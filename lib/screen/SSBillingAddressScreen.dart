import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/checkout_provider.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSPaymentScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

class SSBillingAddressScreen extends StatefulWidget {
  @override
  State<SSBillingAddressScreen> createState() => _SSBillingAddressScreenState();
}

class _SSBillingAddressScreenState extends State<SSBillingAddressScreen> {
  final billingFullNameController = TextEditingController();
  final billingAddressController = TextEditingController();
  final billingCityController = TextEditingController();
  final billingPostCodeController = TextEditingController();
  final billingCountryController = TextEditingController();
  final billingStateController = TextEditingController();

  final shippingFullNameController = TextEditingController();
  final shippingAddressController = TextEditingController();
  final shippingCityController = TextEditingController();
  final shippingPostCodeController = TextEditingController();
  final shippingCountryController = TextEditingController();
  final shippingStateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckOutProvider(),
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
          return SingleChildScrollView(
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
                    Icon(Icons.location_on, color: Color(0xff808080), size: 24),
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
                  controller: billingFullNameController,
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
                    hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
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
                  controller: billingAddressController,
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
                    hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
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
                            controller: billingCityController,
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
                              hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                              filled: true,
                              fillColor: Color(0x00f2f2f3),
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                            controller: billingPostCodeController,
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
                              hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                              filled: true,
                              fillColor: Color(0x07f2f2f3),
                              isDense: false,
                              contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                  controller: billingStateController,
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
                    hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
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
                  controller: billingCountryController,
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
                    hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                    filled: true,
                    fillColor: Color(0x00f2f2f3),
                    isDense: false,
                    contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  ),
                ),
                SizedBox(height: 16),
                if(checkOutProvider.setAsDefaultBillingAddress)Text(
                  "Shipping Address",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: secondaryTextStyle(),
                ),
                if(checkOutProvider.setAsDefaultBillingAddress)TextField(
                  controller: TextEditingController(),
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
                    hintText: "503,Antom Street",
                    hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                    filled: true,
                    fillColor: Color(0x00f2f2f3),
                    isDense: false,
                    contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  ),
                ),
                if(!checkOutProvider.setAsDefaultBillingAddress)Column(
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
                      controller: shippingFullNameController,
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
                        hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
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
                      controller: shippingAddressController,
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
                        hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
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
                                controller: shippingCityController,
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
                                  hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                                  filled: true,
                                  fillColor: Color(0x00f2f2f3),
                                  isDense: false,
                                  contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                                controller: shippingPostCodeController,
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
                                  hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                                  filled: true,
                                  fillColor: Color(0x07f2f2f3),
                                  isDense: false,
                                  contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                      controller: shippingStateController,
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
                        hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
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
                      controller: shippingCountryController,
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
                        hintStyle: boldTextStyle(size: 14,color: Colors.grey.withOpacity(0.5)),
                        filled: true,
                        fillColor: Color(0x00f2f2f3),
                        isDense: false,
                        contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                SizedBox(height: 16),
                Theme(
                  data: ThemeData(
                      unselectedWidgetColor:
                          appStore.isDarkModeOn ? Colors.white : Colors.black),
                  child: CheckboxListTile(
                    checkColor:
                        appStore.isDarkModeOn ? Colors.black : Colors.white,
                    activeColor:
                        appStore.isDarkModeOn ? Colors.white : Colors.black,
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
        bottomNavigationBar: Consumer<CheckOutProvider>(builder: (context,checkOutProvider,_){
          return  Padding(
            padding: EdgeInsets.all(16),
            child: sSAppButton(
              context: context,
              title: 'Continue to payment',
              onPressed: () async{
                final userId = await Amplify.Auth.getCurrentUser().then((value) => value.userId);
                var createOrderData = {
                  'status': OrderStatus.PROCESSING,
                  'currency': "inr",
                  'userId': userId,
                  'totalStoreCredit': 0.0,
                  'totalDiscount': 0.0,
                  'totalAmount': context.read<ShoppingCartProvider>().totalPrice,
                  'totalCashOnDeliveryCharges': 0.0,
                  'orderDate': '${DateTime.now()}',
                  'CouponCodeId': "",
                  'BillingAddress': {
                    'name': billingFullNameController.text,
                    'address': billingAddressController.text,
                    'country': billingCountryController.text,
                    'city': billingCityController.text,
                    'pinCode': billingPostCodeController.text,
                    'state': billingStateController.text
                  },
                  'shippingAddress': {
                    'address': shippingAddressController.text,
                    'city': shippingCityController.text,
                    'country': shippingCountryController.text,
                    'name': shippingFullNameController.text,
                    'pinCode': shippingPostCodeController.text,
                    'state': shippingStateController.text
                  },
                  'totalShippingCharges': 0.0
                };
                checkOutProvider.createOrderCart(data: createOrderData);
                SSPaymentScreen().launch(context);
              },
            ),
          );
        }),
      ),
    );
  }
}
