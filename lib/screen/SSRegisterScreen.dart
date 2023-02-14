import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/screen/SSDashBoardScreen.dart';
import 'package:sneaker_shopping_prokit/utils/SSWidgets.dart';

import '../providers/auth_provider.dart';
import '../utils/SSConstants.dart';

class SSRegisterScreen extends StatelessWidget {
  final userNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => AuthenticationProvider(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 32),
                  Text(
                    "Register",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(size: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Create your new account",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: primaryTextStyle(),
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    controller: userNameController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                    validator:
                        RequiredValidator(errorText: 'user name is required'),
                    decoration: sSInputDecoration(
                      context: context,
                      name: 'User name',
                      icon: Icon(Icons.email,
                          color: Colors.grey.withOpacity(0.4), size: 24),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: middleNameController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                    validator:
                        RequiredValidator(errorText: 'middle name is required'),
                    decoration: sSInputDecoration(
                      context: context,
                      name: 'Middle name',
                      icon: Icon(Icons.email,
                          color: Colors.grey.withOpacity(0.4), size: 24),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: mobileNumberController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    validator:
                        RequiredValidator(errorText: 'mobile is required'),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    decoration: sSInputDecoration(
                      context: context,
                      name: 'Mobile',
                      icon: Icon(Icons.call,
                          color: Colors.grey.withOpacity(0.4), size: 24),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    validator: EmailValidator(
                        errorText: 'enter a valid email address'),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    decoration: sSInputDecoration(
                      context: context,
                      name: 'Email address',
                      icon: Icon(Icons.email,
                          color: Colors.grey.withOpacity(0.4), size: 24),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    validator: passwordValidator,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                    decoration: sSInputDecoration(
                      context: context,
                      name: 'Password',
                      icon: Icon(Icons.lock,
                          color: Colors.grey.withOpacity(0.4), size: 24),
                    ),
                  ),
                  SizedBox(height: 16),
                  Consumer<AuthenticationProvider>(
                      builder: (context, authenticationProvider, _) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          authenticationProvider.signUpUser(
                              middleName: middleNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              name: userNameController.text,
                              nickName: userNameController.text,
                              phoneNumber: mobileNumberController.text,
                              context: context);
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: appStore.isDarkModeOn
                                ? context.cardColor
                                : Color(0xff010101),
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0x4df2e4e4), width: 1),
                          ),
                          child: Icon(Icons.arrow_forward,
                              color: Color(0xfffcfdff), size: 24),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 16),
                  Text(
                    "Already have an account?",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: primaryTextStyle(),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      finish(context);
                    },
                    child: Text(
                      "Sign in",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(color: Colors.red),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
