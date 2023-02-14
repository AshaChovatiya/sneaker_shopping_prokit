import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/component/SSBestODWidget.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/product_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSDetailScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';

import '../utils/SSConstants.dart';

class SSProductItemWidget extends StatelessWidget {
  final List<SneakerShoppingModel> list = getAllData();

  @override
  Widget build(BuildContext context) {
    ProductProvider _productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 60),
      child: Wrap(
        runSpacing: 16,
        spacing: 16,
        children: _productProvider.productList.map(
          (e) {
            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                SSDetailScreen(
                  img: list[0].img,
                  productId: e?.id,
                ).launch(context);
              },
              child: SSBestODWidget(
                title: e!.title,
                img: e.thumbImages == ''
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
    );
  }
}
