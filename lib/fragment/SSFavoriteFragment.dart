import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/wishlist_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';

class SSFavoriteFragment extends StatelessWidget {
  final List<SneakerShoppingModel> list = getAllFavorite();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WishListProvider()..getWishList(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("WishList", style: boldTextStyle()),
        ),
        body: Consumer<WishListProvider>(
            builder: (context, wishListProvider, child) {
          return wishListProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : wishListProvider.isError
                  ? Center(
                      child: Text(
                        wishListProvider.errorMessage,
                        style: boldTextStyle(),
                      ),
                    )
                  : (wishListProvider.wishList?.listWishlists?.items?.isEmpty ??
                          true)
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
                      : ListView.builder(
                          padding: EdgeInsets.all(16),
                          shrinkWrap: true,
                          itemCount: wishListProvider
                              .wishList?.listWishlists?.items?.length,
                          itemBuilder: (_, index) {
                            final item = wishListProvider
                                .wishList!.listWishlists!.items![index];

                            return Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  SSDetailScreen(
                                    productId: item.wishlistProducts!
                                        .wishlistProductItems?[0].productId,
                                  ).launch(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.white12, width: 1),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: item
                                                      .wishlistProducts
                                                      ?.wishlistProductItems?[0]
                                                      .product
                                                      ?.images
                                                      ?.imagesItems?[0]
                                                      .imageKey !=
                                                  null
                                              ? imageBaseApi +
                                                  item
                                                      .wishlistProducts!
                                                      .wishlistProductItems![0]
                                                      .product!
                                                      .images!
                                                      .imagesItems![0]
                                                      .imageKey!
                                              : imagePlaceHolder,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16, width: 16),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                              item
                                                      .wishlistProducts
                                                      ?.wishlistProductItems?[0]
                                                      .product
                                                      ?.title
                                                      .toString() ??
                                                  'Not Found Title',
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              maxLines: 2,
                                              style: boldTextStyle()),
                                          SizedBox(height: 4),
                                          Text(
                                              item
                                                      .wishlistProducts
                                                      ?.wishlistProductItems?[0]
                                                      .product
                                                      ?.additionalInfo ??
                                                  'Not Found Additional Info',
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: secondaryTextStyle()),
                                          SizedBox(height: 4),
                                          Text(
                                              'Quantity:- ' +
                                                  (item
                                                          .wishlistProducts
                                                          ?.wishlistProductItems?[
                                                              0]
                                                          .quantity
                                                          .toString() ??
                                                      '0'),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: secondaryTextStyle()),
                                          SizedBox(height: 4),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                  item
                                                          .wishlistProducts
                                                          ?.wishlistProductItems?[
                                                              0]
                                                          .product
                                                          ?.price
                                                          .toString() ??
                                                      'Not Found Price',
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.clip,
                                                  style:
                                                      boldTextStyle(size: 14)),
                                              SizedBox(height: 16, width: 16),
                                              Container(
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Color(0xa9ffffff),
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          160.0),
                                                  border: Border.all(
                                                      color: Color(0xed000000),
                                                      width: 1),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Align(
                                                    alignment:
                                                        Alignment(0.0, -0.1),
                                                    child: Text(
                                                      "Buy Now",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff000000)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () async {
                                                  showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              "Are you sure?"),
                                                          content: Text(
                                                              "Do you want to remove this item from the cart?"),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      dialogContext);
                                                                },
                                                                child:
                                                                    Text("No")),
                                                            ChangeNotifierProvider(
                                                              create: (context) =>
                                                                  WishListProvider(),
                                                              child: Consumer<WishListProvider>(
                                                                  builder: (context,
                                                                      dialogWishListProvider,
                                                                      child) {
                                                                return dialogWishListProvider
                                                                        .isDeleting
                                                                    ? Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              Colors.blue,
                                                                        ),
                                                                      )
                                                                    : TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          Navigator.pop(
                                                                              dialogContext);
                                                                          await wishListProvider.deleteWishList(
                                                                              wishListId: item.id!);
                                                                        },
                                                                        child: Text(
                                                                            "Yes"));
                                                              }),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xed000000),
                                                        width: 1),
                                                  ),
                                                  child: Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.grey[700],
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
        }),
      ),
    );
  }
}
