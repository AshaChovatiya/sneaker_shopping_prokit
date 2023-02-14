import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/models/ModelProvider.dart';
import 'package:sneaker_shopping_prokit/providers/initial_provider.dart';
import 'package:sneaker_shopping_prokit/providers/product_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSDashBoardScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSSplashScreen.dart';
import 'package:sneaker_shopping_prokit/store/AppStore.dart';
import 'package:sneaker_shopping_prokit/utils/AppTheme.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSDataGenerator.dart';
import 'amplifyconfiguration.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => InitialProvider()..checkSignInStatus(),
          )
        ],
        child: Consumer<InitialProvider>(
            builder: (context, initialProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sneaker Shopping${!isMobile ? ' ${platformName()}' : ''}',
            home: initialProvider.isLoading
                ? Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : initialProvider.isUserLoggedIn
                    ? SSDashBoardScreen()
                    : SSSplashScreen(),
            theme: !appStore.isDarkModeOn
                ? AppThemeData.lightTheme
                : AppThemeData.darkTheme,
            navigatorKey: navigatorKey,
            scrollBehavior: SBehavior(),
            supportedLocales: LanguageDataModel.languageLocales(),
            localeResolutionCallback: (locale, supportedLocales) => locale,
          );
        }),
      ),
    );
  }
}
