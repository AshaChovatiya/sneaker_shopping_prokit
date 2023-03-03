import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/model/ProductListModel.dart';
import 'package:sneaker_shopping_prokit/providers/product_provider.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../providers/add_cart_provider.dart';
import '../providers/shopping_cart_provider.dart';

class AddToShoppingCartBottomSheet extends StatefulWidget {
  AddToShoppingCartBottomSheet({
    Key? key,
    required this.productDataModel,
  }) : super(key: key);

  final Items productDataModel;

  @override
  AddToShoppingCartBottomSheetState createState() =>
      AddToShoppingCartBottomSheetState();
}

class AddToShoppingCartBottomSheetState
    extends State<AddToShoppingCartBottomSheet> {
  int increment = 1;

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
      create: (context) => ShoppingCartProvider(),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
                    border: Border.all(color: Colors.white12, width: 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: widget.productDataModel.images?.items?[0]
                                  .imageKey !=
                              null
                          ? imageBaseApi +
                              widget.productDataModel.images!.items![0].imageKey
                                  .toString()
                          : imagePlaceHolder,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(widget.productDataModel.title ?? "Not available",
                          overflow: TextOverflow.ellipsis,
                          style: boldTextStyle(),
                          maxLines: 3),
                      SizedBox(height: 4),
                      Text(
                          widget.productDataModel.productType ??
                              "Not available",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: secondaryTextStyle()),
                      SizedBox(height: 4),
                      Text(
                          "${NumberFormat.simpleCurrency(name: widget.productDataModel.currency ?? 'INR').currencySymbol} ${widget.productDataModel.price ?? "not available"}",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: primaryTextStyle()),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(color: Colors.grey),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text('Quantity',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle()),
                ),
                InkWell(
                  onTap: () {
                    if (increment > 1) {
                      increment--;
                      setState(() {});
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Icon(Icons.remove, color: Colors.grey, size: 18),
                  ),
                ),
                SizedBox(height: 16, width: 16),
                Text("$increment",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(size: 14)),
                SizedBox(height: 16, width: 16),
                InkWell(
                  onTap: () {
                    increment++;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Icon(Icons.add, color: Colors.grey, size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Consumer<ShoppingCartProvider>(
                builder: (context, shoppingCartProvider, child) {
              return shoppingCartProvider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  : sSAppButton(
                      context: context,
                      title: 'Add to Cart',
                      onPressed: () async {
                        await shoppingCartProvider.createShoppingCart(
                            productId: widget.productDataModel.id!,
                            quantity: increment);
                        finish(context);
                      },
                    );
            })
          ],
        ),
      ),
    );
  }
}
