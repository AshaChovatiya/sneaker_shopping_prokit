import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/search_screen_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSProductScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

class SSSearchFragment extends StatelessWidget {
  final List<SneakerShoppingModel> list = getSearchData();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: Text("Search", style: boldTextStyle()),
      ),
      body: ChangeNotifierProvider(
        create: (_) => SearchScreenProvider(),
        child: Consumer<SearchScreenProvider>(
          builder: (context, _searchScreenProvider, _) {
            return Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: searchController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000)),
                    decoration: sSInputDecoration(
                      context: context,
                      name: 'Search',
                      icon: Icon(Icons.search,
                          color: Colors.grey.withOpacity(0.7), size: 24),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        _searchScreenProvider.onChangeSearch(true);
                        _searchScreenProvider.searchProductCategories(
                          search: searchController.text,
                        );
                      } else {
                        _searchScreenProvider.onChangeSearch(false);
                        _searchScreenProvider.searchProductCategories();
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _searchScreenProvider.isSearchLoading
                      ? Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                          child: _searchScreenProvider
                                      .searchProductCategoriesList.length >
                                  0
                              ? ListView.builder(
                                  padding: EdgeInsets.only(top: 0, bottom: 8),
                                  itemCount: _searchScreenProvider
                                      .searchProductCategoriesList.length,
                                  // shrinkWrap: true,
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.only(top: 8, bottom: 8),
                                      child: InkWell(
                                        onTap: () {
                                          SSProductScreen(img: list[index].img!)
                                              .launch(context);
                                        },
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Image.network(
                                                _searchScreenProvider
                                                            .searchProductCategoriesList[
                                                                index]!
                                                            .imageUrl ==
                                                        ''
                                                    ? imagePlaceHolder
                                                    : imageBaseApi +
                                                        _searchScreenProvider
                                                            .searchProductCategoriesList[
                                                                index]!
                                                            .imageUrl
                                                            .toString(),
                                                height: 250,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.cover),
                                            Container(
                                                height: 250,
                                                color: Colors.black26),
                                            Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _searchScreenProvider
                                                        .searchProductCategoriesList[
                                                            index]!
                                                        .name
                                                        .toString(),
                                                    style: boldTextStyle(
                                                        color: Colors.white,
                                                        size: 12),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Container(
                                                      height: 1,
                                                      width: 50,
                                                      color: Colors.white),
                                                  SizedBox(height: 8),
                                                  Text(
                                                      _searchScreenProvider
                                                              .searchProductCategoriesList[
                                                                  index]!
                                                              .slug ??
                                                          '',
                                                      style: boldTextStyle(
                                                          color: Colors.white))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                    'No Result Found',
                                    style: boldTextStyle(
                                        color: Colors.black, size: 12),
                                  ),
                                ),
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
