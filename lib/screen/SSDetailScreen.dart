import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import '../../../main.dart';
import '../component/AddToShoppingCart.dart';
import '../providers/product_details_provider.dart';
import '../providers/shopping_cart_provider.dart';
import '../utils/SSConstants.dart';
import 'SSAddReviewScreen.dart';
import 'SSBillingAddressScreen.dart';
import 'SSReviewListScreen.dart';
import 'SSSelectCouponCodeScreen.dart';

class SSDetailScreen extends StatefulWidget {
  final String? productId;

  SSDetailScreen({this.productId});

  @override
  SSDetailScreenState createState() => SSDetailScreenState();
}

class SSDetailScreenState extends State<SSDetailScreen> {
  int index = 0;
  String sizes = '1,2,3,4,5,6';
  List<String> img = [
    "images/sneakerShopping/ic_shoes_7.png",
    "images/sneakerShopping/ic_shoes_9.png",
    "images/sneakerShopping/ic_shoes_2.png",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  String? productId;
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductDetailsProvider()
              ..getProductItemData(widget.productId)
              ..getReviewData(widget.productId),
          ),
          ChangeNotifierProvider(
            create: (context) => ShoppingCartProvider()..getCouponCodes(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Image(
              image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
              height: 30,
              width: 30,
              color: appStore.isDarkModeOn ? Colors.white : Colors.black,
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0x00000000), width: 1)),
            leading: InkWell(
              onTap: () {
                finish(context);
              },
              child: Icon(Icons.arrow_back_ios,
                  color: context.iconColor, size: 20),
            ),
            /*actions: [
              Icon(Icons.favorite_border, color: context.iconColor, size: 20)
                  .paddingOnly(right: 16),
            ],*/
          ),
          body: Consumer<ProductDetailsProvider>(
              builder: (context, productDetailsProvider, _) {
            if (productDetailsProvider.productDataModel != null) {
              productId = productDetailsProvider.productDataModel!.id;
              imageUrl = productDetailsProvider
                      .productDataModel!.images?.items?[0].imageKey ??
                  imagePlaceHolder;
            }

            return productDetailsProvider.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: context.height() * 0.4,
                          width: context.width(),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      productDetailsProvider.selectedImage !=
                                              null
                                          ? imageBaseApi +
                                              productDetailsProvider
                                                  .selectedImage!.imageKey
                                                  .toString()
                                                  .validate()
                                          : imagePlaceHolder),
                                  fit: BoxFit.fill)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: productDetailsProvider
                                      .productDataModel!.images!.items!
                                      .map((e) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      radius: 8,
                                      onTap: () {
                                        productDetailsProvider
                                            .changeSelectedImage(e);
                                        /*setState(() {
                                        index = productProvider
                                            .productDataModel!.images!.items!
                                            .indexOf(ImageItems(
                                          imageKey: e.imageKey,
                                          position: e.position,
                                        ));
                                      });*/
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(right: 8),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: context.cardColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: index ==
                                                      img.indexOf(
                                                          e.imageKey.toString())
                                                  ? Colors.red
                                                  : Colors.transparent,
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                            imageUrl: imageBaseApi +
                                                    e.imageKey
                                                        .toString()
                                                        .validate() ??
                                                '',
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          )),
                                    ).paddingRight(8);
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  productDetailsProvider
                                          .productDataModel!.productType ??
                                      '',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: secondaryTextStyle()),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Text(
                                        productDetailsProvider
                                                .productDataModel!.title ??
                                            '',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: boldTextStyle()),
                                  ),
                                  Text(
                                      "${NumberFormat.simpleCurrency(name: productDetailsProvider.productDataModel?.currency ?? 'INR').currencySymbol + productDetailsProvider.productDataModel!.price.toString()}",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: boldTextStyle()),
                                ],
                              ),
                              SizedBox(height: 8),
                              if (productDetailsProvider
                                      .productDataModel!.size !=
                                  null)
                                Text("Available Sizes",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: boldTextStyle(size: 14)),
                              if (productDetailsProvider
                                      .productDataModel!.size !=
                                  null)
                                SizedBox(height: 8),
                              productDetailsProvider.productDataModel!.size ==
                                      null
                                  ? SizedBox()
                                  : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ...List.generate(
                                            productDetailsProvider
                                                .productDataModel!.size!
                                                .split(',')
                                                .length,
                                            (index) => Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(
                                                  right: 8, top: 4, bottom: 4),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 4),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                    color: Color(0x4d9e9e9e),
                                                    width: 1),
                                              ),
                                              child: Text(
                                                  productDetailsProvider
                                                      .productDataModel!.size!
                                                      .split(',')[index],
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.clip,
                                                  style:
                                                      boldTextStyle(size: 12)),
                                            ),
                                          ),
                                          /*  Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  right: 8, top: 4, bottom: 4),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Text("US 7",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle(size: 12)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Text("US 8",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle(size: 12)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                    color: Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Text("US 9",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle(size: 12)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                    color: Color(0x4d9e9e9e), width: 1),
                              ),
                              child: Text("US 10",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle(size: 12)),
                            ),*/
                                        ],
                                      ),
                                    ),
                              SizedBox(height: 16, width: 16),
                              Text("Description",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle()),
                              SizedBox(height: 8),
                              // Html(
                              //   data: productDetailsProvider
                              //           .productDataModel!.additionalInfo ??
                              //       '',
                              //   style: {
                              //     "html": Style(
                              //       fontSize: FontSize(14),
                              //       color: Colors.black,
                              //     ),
                              //   },
                              // ),
                              Html(
                                  data: productDetailsProvider
                                          .productDataModel!.additionalInfo ??
                                      ''),
                              /* Text(
                                productProvider
                                        .productDataModel!.additionalInfo ??
                                    '',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: secondaryTextStyle()),*/
                              SizedBox(height: 8),
                              Html(
                                  data: productDetailsProvider
                                          .productDataModel!.longDescription ??
                                      ''),
                              SizedBox(height: 16),
                              Text("Reviews",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle()),
                              SizedBox(height: 6),
                              if (productDetailsProvider.reviewData?.listReviews
                                      ?.reviewItems?.isNotEmpty ??
                                  false)
                                ListView.builder(
                                    itemCount: (productDetailsProvider
                                                    .reviewData
                                                    ?.listReviews
                                                    ?.reviewItems
                                                    ?.length ??
                                                0) <
                                            2
                                        ? (productDetailsProvider
                                                .reviewData
                                                ?.listReviews
                                                ?.reviewItems
                                                ?.length ??
                                            0)
                                        : 2,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final review = productDetailsProvider
                                          .reviewData
                                          ?.listReviews
                                          ?.reviewItems?[index];

                                      return Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0x4d9e9e9e))),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: double.parse(
                                                      "${review?.rating}"),
                                                  glow: false,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: false,
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  ignoreGestures: true,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.green,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                Text(
                                                    "${review?.reviewer?.name}",
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.clip,
                                                    style: boldTextStyle(
                                                        size: 12,
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("${review?.comment}",
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.clip,
                                                style: boldTextStyle(
                                                    size: 12,
                                                    color: appStore.isDarkModeOn
                                                        ? Colors.white
                                                        : Colors.black)),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                              else
                                Center(
                                  child: Text("No Reviews",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: boldTextStyle(size: 12)),
                                ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddReviewScreen(
                                                    productId:
                                                        productDetailsProvider
                                                            .productDataModel!
                                                            .id!,
                                                  )));
                                      print("Add Review after pop");
                                      context
                                          .read<ProductDetailsProvider>()
                                          .getReviewData(widget.productId);
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: Color(0xa9ffffff),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(160.0),
                                        border: Border.all(
                                            color: Color(0xed000000), width: 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 8),
                                        child: Align(
                                          alignment: Alignment(0.0, -0.1),
                                          child: Text(
                                            "Add Review",
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
                                  ),
                                  if (productDetailsProvider
                                          .reviewData
                                          ?.listReviews
                                          ?.reviewItems
                                          ?.isNotEmpty ??
                                      false)
                                    TextButton(
                                      onPressed: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReviewListScreen(
                                                      reviewData:
                                                          productDetailsProvider
                                                              .reviewData!,
                                                      productId:
                                                          productDetailsProvider
                                                              .productDataModel!
                                                              .id!,
                                                    )));

                                        context
                                            .read<ProductDetailsProvider>()
                                            .getReviewData(widget.productId);
                                      },
                                      child: Text("Show all",
                                          style: secondaryTextStyle()),
                                    )
                                ],
                              ),
                              /* Text(
                                productProvider
                                        .productDataModel!.longDescription ??
                                    '',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: secondaryTextStyle()),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16),
            child: Consumer<ShoppingCartProvider>(
                builder: (context, shoppingCartProvider, child) {
              return shoppingCartProvider.isShowCheckOut
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 8, left: 16, right: 16, bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //color: context.cardColor,
                        boxShadow: defaultBoxShadow(),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text('Promo code',
                                    style: secondaryTextStyle()),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      shoppingCartProvider
                                              .selectedCouponCodeItem?.code ??
                                          'No coupon code available',
                                      style: boldTextStyle()),
                                  SizedBox(height: 3),
                                  InkWell(
                                    onTap: () {
                                      if (shoppingCartProvider
                                              .selectedCouponCodeItem ==
                                          null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeNotifierProvider.value(
                                                        value:
                                                            shoppingCartProvider,
                                                        child:
                                                            SSSelectCouponCodeScreen())));

                                        return;
                                      }
                                      shoppingCartProvider.removeCouponCode();
                                    },
                                    child: Text(
                                        shoppingCartProvider
                                                    .selectedCouponCodeItem ==
                                                null
                                            ? 'Select Coupon Code'
                                            : 'Remove coupon',
                                        style: secondaryTextStyle().copyWith(
                                            fontSize: 10,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  shoppingCartProvider.isShowCheckOut = false;
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.withOpacity(0.6)),
                                  child: Icon(Icons.close,
                                      size: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Divider(color: Colors.grey, height: 1),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${shoppingCartProvider.buyNowQty} Quantity',
                                  style: secondaryTextStyle()),
                              Text(
                                  ' ${NumberFormat.simpleCurrency(name: shoppingCartProvider.shoppingCartProductItems?.product?.currency ?? 'INR').currencySymbol} ${shoppingCartProvider.totalPrice != 0 ? shoppingCartProvider.totalPrice : ''}',
                                  style: boldTextStyle()),
                            ],
                          ),
                          SizedBox(height: 16),
                          sSAppButton(
                            context: context,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider<
                                            ShoppingCartProvider>.value(
                                      value: shoppingCartProvider,
                                      child: SSBillingAddressScreen(
                                        sku: shoppingCartProvider.shoppingCartProductItems?.product?.sku,
                                        title: shoppingCartProvider.shoppingCartProductItems?.product?.title,
                                        productId: productId,
                                        price: shoppingCartProvider.totalPrice,
                                        qty: shoppingCartProvider.buyNowQty,
                                      ),
                                    ),
                                  ));
                            },
                            title: 'Checkout',
                          ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Consumer<ProductDetailsProvider>(
                              builder: (context, productProvider, child) {
                            return IconButton(
                              icon: Icon(Icons.shopping_cart_outlined),
                              onPressed: () {
                                if (productId == null) {
                                  GlobalSnackBar.show(
                                    context: context,
                                    message: 'Something went wrong',
                                    type: SnackBarType.ERROR,
                                  );

                                  return;
                                }
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)),
                                  ),
                                  context: context,
                                  builder: (_) {
                                    return AddToShoppingCartBottomSheet(
                                      productDataModel:
                                          productProvider.productDataModel!,
                                    );
                                    // return AddToCartBottomSheet(
                                    //   productDataModel: productProvider.productDataModel!,
                                    // );
                                  },
                                );
                              },
                            );
                          }),
                        ),
                        SizedBox(width: 8),
                        Consumer<ProductDetailsProvider>(
                            builder: (context, productProvider, child) {
                          return Expanded(
                            child: sSAppButton(
                              context: context,
                              title: 'Buy Now',
                              onPressed: () {
                                shoppingCartProvider.totalPrice =
                                    productProvider.productDataModel?.price ??
                                        0.0;
                                shoppingCartProvider.buyNowQty = 1;
                                shoppingCartProvider.isShowCheckOut = true;
                              },
                            ),
                          );
                        }),
                      ],
                    );
            }),
          ),
        ));
  }
}
