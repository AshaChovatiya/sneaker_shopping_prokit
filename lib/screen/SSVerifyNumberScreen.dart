import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/providers/initial_provider.dart';
import 'package:sneaker_shopping_prokit/screen/SSResetScreen.dart';
import 'package:sneaker_shopping_prokit/screen/SSSignInScreen.dart';
import 'package:sneaker_shopping_prokit/utils/common_snack_bar.dart';

import 'SSDashBoardScreen.dart';

class SSVerifyNumberScreen extends StatefulWidget {
  SSVerifyNumberScreen(
      {Key? key,
      required this.isSignIn,
      this.destination,
      this.phoneNumber,
      this.isReset = false})
      : super(key: key);
  final bool isSignIn;
  final String? destination;
  final bool isReset;
  final String? phoneNumber;

  @override
  State<SSVerifyNumberScreen> createState() => _SSVerifyNumberScreenState();
}

class _SSVerifyNumberScreenState extends State<SSVerifyNumberScreen> {
  int count = 0;
  String otpPin = '';
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final focusNode = FocusNode();
  bool isLoading = false;

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = Colors.black;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 32, width: MediaQuery.of(context).size.width),
              Text("Verify Your Account",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: boldTextStyle(size: 20)),
              Text(
                  "OTP has been sent to ${widget.destination ?? 'your mobile number or mail'}",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: boldTextStyle(size: 20)),
              SizedBox(height: 16, width: 16),
              Text("Enter the otp code sent  to you mail/mobile number",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: secondaryTextStyle()),
              SizedBox(height: 16),
              /* Container(
                height: 50,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          count = index;
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: index != count
                                ? Color(0x1f000000)
                                : context.iconColor,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 16),*/

              if (widget.isReset)
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter New Password",
                    hintStyle: TextStyle(
                      color: Color(0xff9e9e9e),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xff9e9e9e),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xff9e9e9e),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xff9e9e9e),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 16),
              if (widget.isReset)
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm New Password",
                    hintStyle: TextStyle(
                      color: Color(0xff9e9e9e),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xff9e9e9e),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xff9e9e9e),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xff9e9e9e),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: Pinput(
                  length: length,
                  controller: otpController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) async {
                    setState(() {
                      otpPin = pin;
                    });
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 50,
                    width: 50,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: borderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (widget.isSignIn) {
                    Amplify.Auth.resendUserAttributeConfirmationCode(
                        userAttributeKey: CognitoUserAttributeKey.phoneNumber);
                  }
                },
                child: Text(
                  "Resend OTP",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xffeb0b0b)),
                ),
              ),
              SizedBox(height: 32, width: 16),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    if (widget.isReset) {
                      if (passwordController.text.isEmpty) {
                        GlobalSnackBar.show(
                            context: context, message: 'Please enter password');
                        return;
                      }
                      if (confirmPasswordController.text.isEmpty) {
                        GlobalSnackBar.show(
                            context: context,
                            message: 'Please enter confirm password');
                        return;
                      }

                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        GlobalSnackBar.show(
                            context: context,
                            message: 'Password and confirm password not match');
                        return;
                      }
                      try {
                        await Amplify.Auth.confirmResetPassword(
                            username: widget.phoneNumber!,
                            newPassword: passwordController.text,
                            confirmationCode: '$otpPin');

                        GlobalSnackBar.show(
                            context: context,
                            message: 'Password reset success');
                        SSSignInScreen().launch(context, isNewTask: true);
                      } on AmplifyException catch (e) {
                        GlobalSnackBar.show(
                            context: context, message: '${e.message}');
                        showError = true;
                        setState(() {});
                      }

                      return;
                    }

                    if (!widget.isSignIn) {
                      final result = await Amplify.Auth.confirmSignUp(
                          username: widget.phoneNumber!,
                          confirmationCode: '$otpPin');
                      if (result.isSignUpComplete) {
                        GlobalSnackBar.show(
                            context: context, message: 'Register Successfully');
                        finish(context);
                        SSSignInScreen().launch(context);
                      } else {
                        showError = true;
                        setState(() {});
                      }
                    } else {
                      final result = await Amplify.Auth.confirmSignUp(
                          username: widget.phoneNumber!,
                          confirmationCode: '$otpPin');
                      if (result.isSignUpComplete) {
                        GlobalSnackBar.show(
                            context: context, message: 'Please sign in again');
                        finish(context);
                        SSSignInScreen().launch(context, isNewTask: true);
                      } else {
                        showError = true;
                        setState(() {});
                      }
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
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Icon(Icons.arrow_forward,
                            color: Color(0xffffffff), size: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
