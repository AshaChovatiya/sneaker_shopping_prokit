import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/shopping_cart_provider.dart';

class SSMyVoucherScreen extends StatelessWidget {
  const SSMyVoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appStore.appBarColor,
          title: Text(
            'Select Coupon Code',
            style: TextStyle(
              color: appStore.textPrimaryColor,
            ),
          ),
        ),
        body: ChangeNotifierProvider(
            create: (_) => ShoppingCartProvider()..getCouponCodes(),
            child: Consumer<ShoppingCartProvider>(
                builder: (context, shoppingCartProvider, child) {
              return shoppingCartProvider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: ListView.builder(
                          itemCount: shoppingCartProvider
                              .couponCodeData!.listCouponCodes?.items!.length,
                          itemBuilder: (context, index) {
                            final couponCodeItem = shoppingCartProvider
                                .couponCodeData!.listCouponCodes!.items![index];
                            return Card(
                              color: Colors.deepPurple.withOpacity(0.5),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Coupon Code :- ${couponCodeItem.code}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Discount:- ${couponCodeItem.discount ?? 0} %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        'Descriptions:- ${couponCodeItem.description ?? 0}'),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
            })));
  }
}
