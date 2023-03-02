import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';

class SSSelectCouponCodeScreen extends StatelessWidget {
  const SSSelectCouponCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  appBar: AppBar(
        backgroundColor: appStore.appBarColor,
        title: Text(
          'Select Coupon Code',
          style: TextStyle(
            color: appStore.textPrimaryColor,
          ),
        ),
      ),*/
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        backgroundColor: appStore.appBarColor,
        title: Text(
          'Select Coupon Code',
          style: TextStyle(
            color: appStore.textPrimaryColor,
          ),
        ),
      ),
      body: Consumer<ShoppingCartProvider>(
          builder: (context, shoppingCartProvider, child) {
        return ListView.builder(
            itemCount: shoppingCartProvider
                .couponCodeData!.listCouponCodes?.couponCodeItems!.length,
            itemBuilder: (context, index) {
              final couponCodeItem = shoppingCartProvider
                  .couponCodeData!.listCouponCodes!.couponCodeItems![index];
              return InkWell(
                onTap: () {
                  shoppingCartProvider.selectedCouponCodeItem = couponCodeItem;
                  Navigator.pop(context);
                },
                child: Card(
                  color: appStore.scaffoldBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Coupon Code :- ${couponCodeItem.code}'),
                        SizedBox(height: 10),
                        Text('Discount:- ${couponCodeItem.discount ?? 0} %'),
                        SizedBox(height: 10),
                        Text(
                            'Descriptions:- ${couponCodeItem.description ?? 0}'),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
