import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';
import 'package:sneaker_shopping_prokit/store/AppStore.dart';

import '../providers/my_order_provider.dart';
import '../providers/my_shopping_address_provider.dart';
import '../utils/SSConstants.dart';

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
                :(myShoppingAddressProvider.myAddressModel?.byuserIDUserAddress?.userAddressList?.isEmpty ??
                true) ||
                (myShoppingAddressProvider.myAddressModel?.byuserIDUserAddress?.userAddressList == null)
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
                  itemCount: myShoppingAddressProvider.myAddressModel?.byuserIDUserAddress?.userAddressList!.length,
                  itemBuilder: (context, index) {
                    final userAddressList = myShoppingAddressProvider.myAddressModel?.byuserIDUserAddress?.userAddressList![index];
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
                              SizedBox(height: 16, width: 16),
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

}
