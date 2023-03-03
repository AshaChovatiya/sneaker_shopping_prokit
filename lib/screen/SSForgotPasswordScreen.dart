import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/providers/forgot_password_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSVerifyNumberScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../../../main.dart';

class SSForgotPasswordScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotPasswordProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Color(0x00000000), width: 1),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 16),
              Text("Forgot Password", style: boldTextStyle(size: 18)),
              SizedBox(height: 16, width: 16),
              Text("Enter your mobile number", style: primaryTextStyle()),
              SizedBox(height: 16, width: 16),
              Consumer<ForgotPasswordProvider>(
                  builder: (context, forgotPasswordProvider, child) {
                return TextField(
                  controller: phoneController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  onChanged: (String? value) {
                    if (value == null) return;
                    print(value);
                    forgotPasswordProvider.phone = value;
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000)),
                  decoration: sSInputDecoration(
                    context: context,
                    name: 'Mobile',
                    icon: Icon(Icons.call,
                        color: Colors.grey.withOpacity(0.4), size: 24),
                  ),
                );
              }),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Consumer<ForgotPasswordProvider>(
                    builder: (context, forgotPasswordProvider, child) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () async {
                      final data = await forgotPasswordProvider
                          .sendCodeForForgotPassword();

                      if (data) {
                        SSVerifyNumberScreen(
                          isSignIn: false,
                          isReset: true,
                          phoneNumber: '+91' + phoneController.text,
                        ).launch(context);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: appStore.isDarkModeOn
                            ? context.cardColor
                            : Color(0xff010101),
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                      ),
                      child: Icon(Icons.arrow_forward,
                          color: Colors.white, size: 24),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
