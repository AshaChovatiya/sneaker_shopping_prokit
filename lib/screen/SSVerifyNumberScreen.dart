import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';
import 'package:sneaker_shopping_prokit/main.dart';
import 'package:sneaker_shopping_prokit/screen/SSResetScreen.dart';

import 'SSDashBoardScreen.dart';

class SSVerifyNumberScreen extends StatefulWidget {
  SSVerifyNumberScreen({Key? key, required this.isSignIn}) : super(key: key);
  final bool isSignIn;

  @override
  State<SSVerifyNumberScreen> createState() => _SSVerifyNumberScreenState();
}

class _SSVerifyNumberScreenState extends State<SSVerifyNumberScreen> {
  int count = 0;
  String otpPin = '';
  final otpController = TextEditingController();

  final focusNode = FocusNode();

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 32, width: MediaQuery.of(context).size.width),
            Text("Verify Mobile Number",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(size: 20)),
            SizedBox(height: 16, width: 16),
            Text("Enter the otp code sent  to you",
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
            SizedBox(
              height: 50,
              child: Pinput(
                length: length,
                controller: otpController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                onCompleted: (pin) async {
                  if (widget.isSignIn) {
                    setState(() {
                      otpPin = pin;
                    });
                  }
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
                  if (widget.isSignIn) {
                    final result = await Amplify.Auth.confirmSignIn(
                        confirmationValue: otpPin);
                    print(
                        '----------------------${result.nextStep!.signInStep}');
                    if (result.nextStep!.additionalInfo != null) {
                      finish(context);
                      SSDashBoardScreen().launch(context);
                    } else {
                      showError = true;
                      setState(() {});
                    }
                  } else {
                    SSResetScreen().launch(context);
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
                      color: Color(0xffffffff), size: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
