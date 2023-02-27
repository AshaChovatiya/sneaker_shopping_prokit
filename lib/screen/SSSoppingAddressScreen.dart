import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/store/AppStore.dart';

import '../providers/my_shopping_address_provider.dart';

class SSSoppingAddressScreen extends StatelessWidget {
  const SSSoppingAddressScreen({Key? key}) : super(key: key);

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
          'My Shopping Address',
          style: TextStyle(
            color: appStore.textPrimaryColor,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => MyShoppingAddressProvider()..getShoppingAddressList(),
        child: Consumer<MyShoppingAddressProvider>(
          builder: (context, myShoppingAddressProvider, child) {
            return myShoppingAddressProvider.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (myShoppingAddressProvider.myAddressModel?.byuserIDUserAddress
                                ?.userAddressList?.isEmpty ??
                            true) ||
                        (myShoppingAddressProvider.myAddressModel
                                ?.byuserIDUserAddress?.userAddressList ==
                            null)
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
                            itemCount: myShoppingAddressProvider.myAddressModel
                                ?.byuserIDUserAddress?.userAddressList!.length,
                            itemBuilder: (context, index) {
                              final userAddressList = myShoppingAddressProvider
                                  .myAddressModel
                                  ?.byuserIDUserAddress
                                  ?.userAddressList![index];
                              return Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0x4d9e9e9e))),
                                        padding: EdgeInsets.all(10),
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Address No:-',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        (index + 1).toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    myShoppingAddressProvider
                                                        .deleteShoppingCart(
                                                            userAddressId:
                                                                userAddressList!
                                                                    .id!);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.zero,
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          color:
                                                              Color(0x4d9e9e9e),
                                                          width: 1),
                                                    ),
                                                    child:
                                                        myShoppingAddressProvider
                                                                .isDeleting
                                                            ? Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                              )
                                                            : Icon(Icons.delete,
                                                                color:
                                                                    Colors.grey,
                                                                size: 18),
                                                  ),
                                                ),
                                                /*Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.zero,
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color:
                                                            Color(0x4d9e9e9e),
                                                        width: 1),
                                                  ),
                                                  child: Icon(Icons.edit,
                                                      color: Colors.grey,
                                                      size: 18),
                                                ),*/
                                              ],
                                            ),
                                            Divider(
                                              color: AppStore()
                                                  .backgroundSecondaryColor,
                                              thickness: 1.2,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Name:-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    userAddressList?.name ?? '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Address:-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    userAddressList?.address ??
                                                        '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'City:-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    userAddressList?.city ?? '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Country:-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    userAddressList?.country ??
                                                        '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'PinCode:-',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    userAddressList?.pinCode ??
                                                        '',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
}
