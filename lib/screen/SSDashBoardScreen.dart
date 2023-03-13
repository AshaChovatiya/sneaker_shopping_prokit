import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/fragment/SSCartFragment.dart';
import 'package:sneaker_shopping_prokit/fragment/SSFavoriteFragment.dart';
import 'package:sneaker_shopping_prokit/fragment/SSHomeFragment.dart';
import 'package:sneaker_shopping_prokit/fragment/SSProfileFragment.dart';
import 'package:sneaker_shopping_prokit/fragment/SSSearchFragment.dart';

import '../providers/initial_provider.dart';

class SSDashBoardScreen extends StatefulWidget {
  @override
  State<SSDashBoardScreen> createState() => _SSDashBoardScreenState();
}

class _SSDashBoardScreenState extends State<SSDashBoardScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    SSHomeFragment(),
    SSSearchFragment(),
    SSCartFragment(),
    SSFavoriteFragment(),
    SSProfileFragment(),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 500,
            width: context.width(),
            color: Colors.red,
            child: Center(
              child: Text('No Internet Connection',
                  style: boldTextStyle(color: Colors.white)),
            ),
          ).visible(context.read<InitialProvider>().connectionState ==
              ConnectivityResult.none),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                  activeIcon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                  activeIcon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: '',
                  activeIcon: Icon(Icons.shopping_cart)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: '',
                  activeIcon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: '',
                  activeIcon: Icon(Icons.person)),
            ],
            currentIndex: selectedIndex,
            unselectedItemColor: Color(0xff9e9e9e),
            selectedItemColor: context.iconColor,
            iconSize: 24,
            selectedFontSize: 14,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedFontSize: 14,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
          )
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
