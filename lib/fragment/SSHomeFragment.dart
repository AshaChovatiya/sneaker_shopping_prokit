import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/component/SSBestODWidget.dart';
import 'package:sneaker_shopping_prokit/model/ProductListModel.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSViewAllScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../../../main.dart';
import '../providers/product_provider.dart';
import '../utils/SSConstants.dart';

class SSHomeFragment extends StatefulWidget {
  @override
  State<SSHomeFragment> createState() => _SSHomeFragmentState();
}

class _SSHomeFragmentState extends State<SSHomeFragment> {
  final List<SneakerShoppingModel> list = getAllData();
  final List<SneakerShoppingModel> data = getSearchData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    afterBuildCreated(() {
      // dialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider()..getData(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image(
            image: AssetImage('images/sneakerShopping/ic_sneaker_logo.png'),
            height: 30,
            width: 30,
            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
            fit: BoxFit.cover,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Consumer<ProductProvider>(builder: (context, productProvider, _) {
          final ListProducts? items = productProvider.productList!.listProducts;
          return productProvider.homeLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Responsive(
                        web: Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Image(
                              image: AssetImage(
                                  'images/sneakerShopping/ic_banner1.jpg'),
                              height: 600,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover),
                        ),
                        mobile: Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Image(
                            image: AssetImage(
                                'images/sneakerShopping/ic_banner1.jpg'),
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      (items?.items?.isEmpty) ?? true
                          ? SizedBox()
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("Best of OD",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: boldTextStyle()),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider<
                                                    ProductProvider>.value(
                                              value: productProvider,
                                              child: SSViewAllScreen(),
                                            ),
                                          ));
                                    },
                                    child: Text("Show all",
                                        style: secondaryTextStyle()),
                                  ),
                                ],
                              ),
                            ),
                      (items?.items?.isEmpty) ?? true
                          ? SizedBox()
                          : HorizontalList(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              itemCount: items!.items!.length < 4
                                  ? productProvider
                                      .productList!.listProducts!.items!.length
                                  : 4,
                              itemBuilder: (_, index) {
                                return (items.items?.isEmpty) ?? true
                                    ? SizedBox()
                                    : InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangeNotifierProvider<
                                                        ProductProvider>.value(
                                                  value: productProvider,
                                                  child: SSDetailScreen(
                                                    productId:
                                                        items.items![index].id,
                                                  ),
                                                ),
                                              ));
                                          /*SSDetailScreen(
                                            productId: items.items![index].id,
                                          ).launch(context);*/
                                        },
                                        child: SSBestODWidget(
                                          isWishList: productProvider
                                              .wishListedProducts
                                              .contains(items.items![index].id),
                                          product: items.items![index],
                                          title: items.items![index].title,
                                          img:
                                              items.items![index].thumbImages !=
                                                      null
                                                  ? imageBaseApi +
                                                      items.items![index]
                                                          .thumbImages
                                                          .toString()
                                                  : imagePlaceHolder,
                                          subtitle:
                                              items.items![index].productType,
                                          amount: items.items![index].price
                                              .toString(),
                                          amountType:
                                              items.items![index].currency,
                                        ),
                                      );
                              },
                            ),
                      SizedBox(height: 16, width: 16),
                      if (productProvider
                              .newArrivals?.listProducts?.items?.length !=
                          null)
                        Padding(
                          padding: EdgeInsets.only(left: 16, bottom: 8),
                          child: Text("New Arrivals",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle()),
                        ),
                      productProvider
                                  .newArrivals?.listProducts?.items?.length ==
                              null
                          ? SizedBox()
                          : Responsive(
                              mobile: ListView.builder(
                                padding: EdgeInsets.all(8),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: productProvider
                                    .newArrivals!.listProducts!.items!.length,
                                itemBuilder: (_, index) {
                                  return arrivalWidget(
                                      context: context,
                                      img: productProvider
                                          .newArrivals!
                                          .listProducts!
                                          .items![index]
                                          .thumbImages);
                                },
                              ),
                            )
                    ],
                  ),
                );
        }),
      ),
    );
  }

  Future<void> dialog() async {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: 300,
            width: 300,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image(
                        image: AssetImage(
                            'images/sneakerShopping/ic_arrivals_2.jpg'),
                        height: 200,
                        width: context.width(),
                        fit: BoxFit.cover),
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(Icons.close, color: Colors.black),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(16),
                  width: context.width(),
                  color: context.cardColor,
                  child: sSAppButton(
                    textColor: Colors.white,
                    title: 'Shop Now',
                    context: context,
                    onPressed: () {
                      finish(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
