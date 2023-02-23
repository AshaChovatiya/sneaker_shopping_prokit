import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/screen/SSBillingAddressScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import '../providers/shopping_cart_provider.dart';

class SSCartFragment extends StatefulWidget {
  @override
  SSCartFragmentState createState() => SSCartFragmentState();
}

class SSCartFragmentState extends State<SSCartFragment> {
  final List<SneakerShoppingModel> list = getAllCart();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShoppingCartProvider()..getShoppingCartList(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Color(0x00000000), width: 1),
          ),
          title: Text("Cart", style: boldTextStyle()),
        ),
        body: Consumer<ShoppingCartProvider>(
            builder: (context, shoppingCartProvider, _) {
          return shoppingCartProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (shoppingCartProvider.shoppingCart?.listShoppingCarts
                          ?.listShoppingCartsitems?.isEmpty) ??
                      true
                  ? Center(
                      child: Text("No items in cart"),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(16),
                      shrinkWrap: true,
                      itemCount: shoppingCartProvider.shoppingCart
                          ?.listShoppingCarts?.listShoppingCartsitems?.length,
                      itemBuilder: (_, index) {
                        final shoppingCartItem = shoppingCartProvider
                            .shoppingCart!
                            .listShoppingCarts!
                            .listShoppingCartsitems![index];
                        return (shoppingCartItem.shoppingcartProducts!
                                    .shoppingcartProductsitems?.isEmpty) ??
                                true
                            ? SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            imageUrl: shoppingCartItem
                                                        .shoppingcartProducts!
                                                        .shoppingcartProductsitems![
                                                            0]
                                                        .product!
                                                        .thumbImages !=
                                                    null
                                                ? imageBaseApi +
                                                    shoppingCartItem
                                                        .shoppingcartProducts!
                                                        .shoppingcartProductsitems![
                                                            0]
                                                        .product!
                                                        .thumbImages!
                                                : imagePlaceHolder,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          )
                                          /*Image(
                                            image:
                                                AssetImage(list[index].img!),
                                            height: 80,
                                            width: 140,
                                            fit: BoxFit.cover),*/
                                          ),
                                    ),
                                    SizedBox(height: 16, width: 16),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                                shoppingCartItem
                                                    .shoppingcartProducts!
                                                    .shoppingcartProductsitems![
                                                        0]
                                                    .product!
                                                    .title
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: boldTextStyle()),
                                            SizedBox(height: 4),
                                            Text(
                                                shoppingCartItem
                                                        .shoppingcartProducts!
                                                        .shoppingcartProductsitems![
                                                            0]
                                                        .product!
                                                        .additionalInfo ??
                                                    '',
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: secondaryTextStyle()),
                                            SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${shoppingCartItem.shoppingcartProducts!.shoppingcartProductsitems![0].product!.currency ?? '' + shoppingCartItem.shoppingcartProducts!.shoppingcartProductsitems![0].product!.price.toString()}",
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.clip,
                                                  style:
                                                      boldTextStyle(size: 14),
                                                ),
                                                SizedBox(width: 32),
                                                Text(
                                                    'x ${shoppingCartItem.shoppingcartProducts!.shoppingcartProductsitems![0].quantity}',
                                                    style: secondaryTextStyle(
                                                        size: 14)),
                                                InkWell(
                                                  onTap: () async {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Are you sure?"),
                                                            content: Text(
                                                                "Do you want to remove this item from the cart?"),
                                                            actions: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        dialogContext);
                                                                  },
                                                                  child: Text(
                                                                      "No")),
                                                              ChangeNotifierProvider(
                                                                create: (context) =>
                                                                    ShoppingCartProvider(),
                                                                child: Consumer<
                                                                        ShoppingCartProvider>(
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
                                                                            Navigator.pop(dialogContext);
                                                                            await shoppingCartProvider.deleteWishList(shoppingCartId: shoppingCartItem.id!);
                                                                          },
                                                                          child:
                                                                              Text("Yes"));
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
                                    ),
                                  ],
                                ),
                              );
                      },
                    );
        }),
        bottomSheet: Consumer<ShoppingCartProvider>(
          builder: (context, shoppingCartProvider, _) {
            return (shoppingCartProvider.shoppingCart?.listShoppingCarts
                ?.listShoppingCartsitems?.isEmpty) ??
                true
                ? SizedBox() : Container(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                //color: context.cardColor,
                boxShadow: defaultBoxShadow(),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('Promo code', style: secondaryTextStyle()),
                      ),
                      Text('NK54T3U', style: boldTextStyle()),
                      SizedBox(width: 16),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.6)),
                        child: Icon(Icons.close, size: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.grey, height: 1),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${shoppingCartProvider.shoppingCart?.listShoppingCarts
                          ?.listShoppingCartsitems?.length} items', style: secondaryTextStyle()),
                      Text(
                          '\$${shoppingCartProvider.totalPrice != 0 ? shoppingCartProvider.totalPrice : ''}',
                          style: boldTextStyle()),
                    ],
                  ),
                  SizedBox(height: 16),
                  sSAppButton(
                    context: context,
                    onPressed: () {
                      SSBillingAddressScreen().launch(context);
                    },
                    title: 'Checkout',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
