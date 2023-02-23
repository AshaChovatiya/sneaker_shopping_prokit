import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/search_screen_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSProductScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

class SSSearchFragment extends StatefulWidget {
  @override
  State<SSSearchFragment> createState() => _SSSearchFragmentState();
}

class _SSSearchFragmentState extends State<SSSearchFragment> {
  final List<SneakerShoppingModel> list = getSearchData();

  final searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Provider.of<SearchScreenProvider>(context, listen: false)
        .searchProductItems
        ?.clear();
    Provider.of<SearchScreenProvider>(context, listen: false)
      ..searchProductData(search: "Wow", isScroll: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<SearchScreenProvider>(context, listen: false)
            .searchProductData(search: searchController.text, isScroll: true);
      }
    });
  }

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
      body: Column(
        children: [
          Consumer<SearchScreenProvider>(
              builder: (context, _searchScreenProvider, _) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: TextField(
                controller: searchController,
                obscureText: false,
                textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: appStore.isDarkModeOn
                        ? Color(0xffffffff)
                        : Color(0xff000000)),
                decoration: sSInputDecoration(
                  name: "Search",
                  context: context,
                  icon: Icon(Icons.search,
                      color: Colors.grey.withOpacity(0.7), size: 24),
                ),
                onChanged: (value) async {
                  await _searchScreenProvider.searchProductData(
                      search: searchController.text);
                },
                /*onEditingComplete: () {
                  _searchScreenProvider.searchProductData(
                      search: searchController.text);
                },*/
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<SearchScreenProvider>(
              builder: (context, _searchScreenProvider, _) {
                return _searchScreenProvider.isSearchLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: _searchScreenProvider.isSearchLoading
                            ? Center(child: CircularProgressIndicator())
                            : _searchScreenProvider
                                        .searchProductItems?.isNotEmpty ??
                                    false
                                ? ListView.builder(
                                    controller: _scrollController,
                                    padding: EdgeInsets.only(top: 0, bottom: 8),
                                    itemCount: _searchScreenProvider
                                        .searchProductItems?.length,
                                    // shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      if (_searchScreenProvider.isPagination &&
                                          index ==
                                              _searchScreenProvider
                                                      .searchProductItems!
                                                      .length -
                                                  1) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: InkWell(
                                                onTap: () {
                                                  SSProductScreen(
                                                          img: list[index].img!)
                                                      .launch(context);
                                                },
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Image.network(
                                                        _searchScreenProvider
                                                                    .searchProductItems![
                                                                        index]
                                                                    .images!
                                                                    .productImagesItems![
                                                                        0]
                                                                    .imageKey ==
                                                                ''
                                                            ? imagePlaceHolder
                                                            : imageBaseApi +
                                                                _searchScreenProvider
                                                                    .searchProductItems![
                                                                        index]
                                                                    .images!
                                                                    .productImagesItems![
                                                                        0]
                                                                    .imageKey!,
                                                        height: 250,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        fit: BoxFit.fill),
                                                    Container(
                                                        height: 250,
                                                        color: Colors.black26),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            _searchScreenProvider
                                                                .searchProductItems![
                                                                    index]
                                                                .title
                                                                .toString(),
                                                            style: boldTextStyle(
                                                                color: Colors
                                                                    .white,
                                                                size: 12),
                                                          ),
                                                          SizedBox(height: 8),
                                                          Container(
                                                              height: 1,
                                                              width: 50,
                                                              color:
                                                                  Colors.white),
                                                          SizedBox(height: 8),
                                                          Text(
                                                              _searchScreenProvider
                                                                      .searchProductItems![
                                                                          index]
                                                                      .slug ??
                                                                  '',
                                                              style: boldTextStyle(
                                                                  color: Colors
                                                                      .white))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          ],
                                        );
                                      }
                                      return Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
                                        child: InkWell(
                                          onTap: () {
                                            SSProductScreen(
                                                    img: list[index].img!)
                                                .launch(context);
                                          },
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              Image.network(
                                                  _searchScreenProvider
                                                              .searchProductItems![
                                                                  index]
                                                              .images!
                                                              .productImagesItems![
                                                                  0]
                                                              .imageKey ==
                                                          ''
                                                      ? imagePlaceHolder
                                                      : imageBaseApi +
                                                          _searchScreenProvider
                                                              .searchProductItems![
                                                                  index]
                                                              .images!
                                                              .productImagesItems![
                                                                  0]
                                                              .imageKey!,
                                                  height: 250,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  fit: BoxFit.fill),
                                              Container(
                                                  height: 250,
                                                  color: Colors.black26),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _searchScreenProvider
                                                          .searchProductItems![
                                                              index]
                                                          .title
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
                                                                .searchProductItems![
                                                                    index]
                                                                .slug ??
                                                            '',
                                                        style: boldTextStyle(
                                                            color:
                                                                Colors.white))
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
                                          color: appStore.isDarkModeOn
                                              ? Color(0xffffffff)
                                              : Color(0xff000000),
                                          size: 12),
                                    ),
                                  ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
