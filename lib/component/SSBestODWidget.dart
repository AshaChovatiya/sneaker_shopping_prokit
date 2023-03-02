import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/component/AddToCartBottomSheet.dart';
import 'package:sneaker_shopping_prokit/providers/product_provider.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import '../model/ProductListModel.dart';

class SSBestODWidget extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? amount;
  final String? amountType;
  final Items? product;
  final bool isWishList;

  SSBestODWidget({
    this.img,
    this.title,
    this.subtitle,
    this.amount,
    this.amountType,
    this.product,
    this.isWishList = false,
  });

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
                      if (product?.id == null) {
                        GlobalSnackBar.show(
                          context: context,
                          message: 'Something went wrong',
                          type: SnackBarType.ERROR,
                        );

                        return;
                      }

                      if (isWishList) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Remove from wishlist'),
                                content: Text(
                                    'Are you sure you want to remove this product from wishlist?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel')),
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        Provider.of<ProductProvider>(context,
                                            listen: false)
                                          ..deleteWishList(
                                              wishListId: product!.id!);
                                      },
                                      child: Text('Remove')),
                                ],
                              );
                            });

                        return;
                      }
                      await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                        ),
                        context: context,
                        builder: (_) {
                          return ChangeNotifierProvider.value(
                              value: context.read<ProductProvider>(),
                              child: AddToCartBottomSheet(
                                productDataModel: product!,
                              ));
                        },
                      );
                      //context.read<ProductProvider>().getData();
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
                      child: Icon(
                          isWishList ? Icons.favorite : Icons.favorite_outline,
                          color: isWishList ? Colors.red : context.iconColor,
                          size: 18),
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
