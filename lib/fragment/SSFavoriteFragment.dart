import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/wishlist_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';

class SSFavoriteFragment extends StatelessWidget {
  final List<SneakerShoppingModel> list = getAllFavorite();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WishListProvider()..getWishList(context),
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
              : (wishListProvider.wishList?.isEmpty ?? true)
                  ? Center(
                      child: Text("No Data Found"),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(16),
                      shrinkWrap: true,
                      itemCount: wishListProvider.wishList?.length,
                      itemBuilder: (_, index) {
                        final item = wishListProvider.wishList![index];

                        return Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              SSDetailScreen(img: list[index].img)
                                  .launch(context);
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
                                      imageUrl: item?.toString() ?? '',
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16, width: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                        item?.toString().length.toString() ??
                                            'Not Found Title',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: boldTextStyle()),
                                    SizedBox(height: 4),
                                    Text(item.id ?? 'Not Found Additional Info',
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
                                            item.toString() ??
                                                'Not Found Price',
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.clip,
                                            style: boldTextStyle(size: 14)),
                                        SizedBox(height: 16, width: 16),
                                        Container(
                                          margin: EdgeInsets.zero,
                                          padding: EdgeInsets.zero,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xa9ffffff),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(160.0),
                                            border: Border.all(
                                                color: Color(0xed000000),
                                                width: 1),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Align(
                                              alignment: Alignment(0.0, -0.1),
                                              child: Text(
                                                "Buy Now",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12,
                                                    color: Color(0xff000000)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
