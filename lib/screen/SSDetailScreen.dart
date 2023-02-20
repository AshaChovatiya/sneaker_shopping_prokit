import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/component/AddToCartBottomSheet.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../../../main.dart';
import '../model/ImageModel.dart';
import '../providers/product_provider.dart';
import '../utils/SSConstants.dart';

class SSDetailScreen extends StatefulWidget {
  final String? img;
  final String? productId;

  SSDetailScreen({this.img, this.productId});

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

    init();
  }

  void init() async {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.getProductItemData(widget.productId);
    // img.insert(0, widget.img.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        actions: [
          Icon(Icons.favorite_border, color: context.iconColor, size: 20)
              .paddingOnly(right: 16),
        ],
      ),
      body: Consumer<ProductProvider>(builder: (context, productProvider, _) {
        return productProvider.productDetailLoading
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
                                  productProvider.selectedImage != null
                                      ? imageBaseApi +
                                          productProvider
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
                              children: productProvider
                                  .productDataModel!.images!.items!
                                  .map((e) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  radius: 8,
                                  onTap: () {
                                    productProvider.changeSelectedImage(e);
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
                                        borderRadius: BorderRadius.circular(8),
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
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
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
                              productProvider.productDataModel!.productType ??
                                  '',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: secondaryTextStyle()),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Text(
                                    productProvider.productDataModel!.title ??
                                        '',
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: boldTextStyle()),
                              ),
                              Text(
                                  "${productProvider.productDataModel?.currency ?? '' + productProvider.productDataModel!.price.toString()}",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: boldTextStyle()),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text("Available Sizes",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(size: 14)),
                          SizedBox(height: 8),
                          productProvider.productDataModel!.size == null
                              ? SizedBox()
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ...List.generate(
                                        productProvider.productDataModel!.size!
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
                                              productProvider
                                                  .productDataModel!.size!
                                                  .split(',')[index],
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.clip,
                                              style: boldTextStyle(size: 12)),
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
                          Html(
                            data: productProvider
                                    .productDataModel!.additionalInfo ??
                                '',
                            style: {
                              "html": Style(
                                fontSize: FontSize(14),
                                color: Colors.black,
                              ),
                            },
                          ),
                          Html(
                              data: productProvider
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
                              data: productProvider
                                      .productDataModel!.longDescription ??
                                  ''),
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
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: sSAppButton(
                context: context,
                title: 'Buy Now',
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    context: context,
                    builder: (_) {
                      return AddToCartBottomSheet();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
