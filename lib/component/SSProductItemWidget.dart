import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/component/SSBestODWidget.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/product_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';

import '../utils/SSConstants.dart';

class SSProductItemWidget extends StatefulWidget {
  @override
  State<SSProductItemWidget> createState() => _SSProductItemWidgetState();
}

class _SSProductItemWidgetState extends State<SSProductItemWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('scrolling');
        Provider.of<ProductProvider>(context, listen: false)
            .getData(isScroll: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, _productProvider, child) {
      print(_productProvider.productDetail?.length);
      return _productProvider.homeLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final e = _productProvider.productDetail![index];
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            SSDetailScreen(
                              productId: e.id,
                            ).launch(context);
                          },
                          child: SSBestODWidget(
                            isWishList: _productProvider.wishListedProducts
                                .contains(e.id),
                            title: e.title,
                            img: e.thumbImages == null
                                ? imagePlaceHolder
                                : imageBaseApi + e.thumbImages.toString(),
                            subtitle: e.productType,
                            amount: e.price.toString(),
                            amountType: e.currency,
                            product: e,
                          ),
                        );
                      },
                      childCount: _productProvider.productDetail?.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.6),
                  ),
                  if (_productProvider.isPagination)
                    SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              appStore.isDarkModeOn
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                ],
              ),
            );
    });
    /* SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 60),
      child: Wrap(
        runSpacing: 16,
        spacing: 16,
        children: _productProvider.productDetail!.map(
          (e) {
            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                SSDetailScreen(
                  productId: e.id,
                ).launch(context);
              },
              child: SSBestODWidget(
                title: e.title,
                img: e.thumbImages == null
                    ? imagePlaceHolder
                    : imageBaseApi + e.thumbImages.toString(),
                subtitle: e.productType,
                amount: e.price.toString(),
                amountType: e.currency,
              ),
            );
          },
        ).toList(),
      ),
    );*/
  }
}
