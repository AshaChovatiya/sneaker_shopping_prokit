import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/model/SneakerShoppingModel.dart';
import 'package:sneaker_shopping_prokit/providers/profile_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSSelectCouponCodeScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSColors.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../screen/SSMyOrderListScreen.dart';
import '../screen/SSMyVoucherScreen.dart';
import '../screen/SSSignInScreen.dart';
import '../screen/SSSoppingAddressScreen.dart';

class SSProfileFragment extends StatelessWidget {
  final List<SneakerShoppingModel> data = getAccount();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider()..getUserData(),
      child:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text("My Account", style: boldTextStyle()),
          ),
          body: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
            if (profileProvider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            final userData = profileProvider.userData.getUser;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image(
                              image: userData?.profilePhotoUrl == null
                                  ? AssetImage(
                                      'images/sneakerShopping/ic_arrivals_1.jpg')
                                  : NetworkImage(userData!.profilePhotoUrl!)
                                      as ImageProvider,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.2, -0.2),
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xff000000),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0x4d9e9e9e), width: 1)),
                          child: Icon(Icons.edit,
                              color: Color(0xffffffff), size: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16, width: 16),
                  Text(
                      (userData?.firstName ?? '') +
                          ' ' +
                          (userData?.lastName ?? ''),
                      style: primaryTextStyle()),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      settingWidget(title: '0', subtitle: 'Processing'),
                      Container(
                          height: 30,
                          width: 1,
                          color: Colors.grey,
                          margin: EdgeInsets.only(bottom: 16)),
                      settingWidget(title: '1', subtitle: 'Shipped'),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: 16),
                      ),
                      settingWidget(title: '0', subtitle: 'Pickup'),
                    ],
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (_, index) {
                      return listTileWidgets(
                          context: context,
                          sneakerShoppingModel: data[index],
                          onTab: () {
                            if (index == 0) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSMyOrderListScreen()));
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSMyVoucherScreen()));
                            } else if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSSoppingAddressScreen()));
                            } else if (index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSSignInScreen()));
                            } else if (index == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSSignInScreen()));
                            } else if (index == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSSignInScreen()));
                            } else if (index == 6) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SSSignInScreen()));
                            }
                          });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DarkMode', style: boldTextStyle(size: 16)),
                      Switch(
                        value: appStore.isDarkModeOn,
                        activeColor: appColorPrimary,
                        onChanged: (s) {
                          appStore.toggleDarkMode(value: s);
                        },
                      )
                    ],
                  ).onTap(() {
                    appStore.toggleDarkMode();
                  }),
                  SizedBox(height: 8, width: 16),
                  Divider(
                      color: Colors.grey.withOpacity(0.5),
                      height: 16,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0),
                  InkWell(
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: Text("Logout"),
                              content: Text("Are you sure you want to logout?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext);
                                    },
                                    child: Text("Cancel")),
                                TextButton(
                                    onPressed: () async {
                                      try {
                                        await Amplify.Auth.signOut();
                                        Navigator.pop(dialogContext);
                                        finish(context);
                                        SSSignInScreen()
                                            .launch(context, isNewTask: true);
                                      } on AuthException catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Text("Logout")),
                              ],
                            );
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Logout',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 16)),
                        Icon(Icons.arrow_forward_ios,
                            color: context.iconColor, size: 17),
                      ],
                    ),
                  ),
                  SizedBox(height: 8, width: 16),
                ],
              ),
            );
          }),
        );
      }),
    );
  }

  listTileWidgets(
      {required BuildContext context,
      required SneakerShoppingModel sneakerShoppingModel,
      Function? onTab}) {
    return GestureDetector(
      onTap: () {
        onTab!();
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(sneakerShoppingModel.name!,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(size: 16)),
                  Icon(Icons.arrow_forward_ios,
                      color: context.iconColor, size: 17),
                ],
              ),
              SizedBox(height: 8, width: 16),
              Divider(
                  color: Colors.grey.withOpacity(0.5),
                  height: 16,
                  thickness: 0,
                  indent: 0,
                  endIndent: 0),
            ],
          ),
        ),
      ),
    );
  }
}
