import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/models/Product.dart';
import 'package:sneaker_shopping_prokit/providers/initial_provider.dart';
import 'package:sneaker_shopping_prokit/service/mutations.dart';

import '../model/ProductListModel.dart';
import '../models/WishlistProduct.dart';

class SSBestODWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? amount;
  final String? amountType;
  final Items? product;

  SSBestODWidget(
      {this.img,
      this.title,
      this.subtitle,
      this.amount,
      this.amountType,
      this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 2 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Stack(
              children: [
                Image.network(
                  img!,
                  fit: BoxFit.fill,
                  height: 170,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () async {
                      final userId =
                          context.read<InitialProvider>().currentUser?.userId;
                      if (userId == null || product == null) return;

                      //Todo Add to wishlist
                      /*final WishlistProduct wishlistProduct = WishlistProduct(
                        productId: product!.id.toString(),
                        wishlistId: '1',
                        quantity: 0,
                        product: product,
                        variant: null,
                      );

                      await AWSMutations.addWishList(
                          userId: userId, wishlistProduct: wishlistProduct);*/
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 8, top: 8),
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.cardColor,
                      ),
                      child: Icon(Icons.favorite, color: Colors.red, size: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Text(subtitle ?? '', style: secondaryTextStyle(size: 12)),
          SizedBox(height: 4),
          Container(
            width: context.width() / 2 - 12,
            child:
                Text(title ?? '', maxLines: 2, style: boldTextStyle(size: 14)),
          ),
          SizedBox(height: 4),
          Text('${amountType ?? '' + ' ' + amount.toString()}',
              style: secondaryTextStyle(size: 12)),
        ],
      ),
    );
  }
}
