import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/auth_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSForgotPasswordScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSRegisterScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSConstants.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

class SSSignInScreen extends StatelessWidget {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthenticationProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:
                Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 32, width: 16),
                Text("Sign In",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle()),
                SizedBox(height: 8),
                Text("Please sign in continue app",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: primaryTextStyle()),
                SizedBox(height: 32),
                TextFormField(
                  controller: phoneNumberController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  validator: RequiredValidator(
                      errorText: 'Please Enter Mobile Number'),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14),
                  decoration: sSInputDecoration(
                    context: context,
                    icon: Icon(Icons.email,
                        color: Colors.grey.withOpacity(0.4), size: 24),
                    name: 'Mobile Number',
                  ),
                ),
                SizedBox(height: 16, width: 16),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  validator: passwordValidator,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14),
                  decoration: sSInputDecoration(
                    context: context,
                    icon: Icon(Icons.lock,
                        color: Colors.grey.withOpacity(0.4), size: 24),
                    name: 'Password',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text('Forgot Password?',
                        style: boldTextStyle(size: 16, color: Colors.red)),
                    onPressed: () {
                      SSForgotPasswordScreen().launch(context);
                    },
                  ),
                ),
                SizedBox(height: 8),
                Consumer<AuthenticationProvider>(
                    builder: (context, authenticationProvider, _) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await authenticationProvider.signInUser(
                              phoneNumber: phoneNumberController.text,
                              password: passwordController.text,
                              context: context);
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
                          border:
                              Border.all(color: Color(0x4d9e9e9e), width: 1),
                        ),
                        child: authenticationProvider.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ))
                            : Icon(Icons.arrow_forward,
                                color: Color(0xfffcfdff), size: 24),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 8),
                Text("Don't have an account?",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: primaryTextStyle()),
                TextButton(
                  onPressed: () {
                    SSRegisterScreen().launch(context);
                  },
                  child:
                      Text("Register", style: boldTextStyle(color: Colors.red)),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment(0.2, 0.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.2)),
                        child: Image(
                            image: AssetImage(
                                "images/sneakerShopping/ic_facebook.png"),
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover),
                      ),
                      SizedBox(width: 16),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.2)),
                        child: Image(
                            image: AssetImage(
                                "images/sneakerShopping/ic_google.png"),
                            height: 25,
                            width: 25,
                            fit: BoxFit.contain),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
