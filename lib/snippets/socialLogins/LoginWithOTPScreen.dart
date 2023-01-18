import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vistech/main.dart';
import 'package:vistech/main/components/AppStackLoader.dart';
import 'package:vistech/main/services/LoginService.dart';
import 'package:vistech/main/utils/AppColors.dart';
import 'package:vistech/main/utils/AppConstants.dart';
import 'package:vistech/main/utils/AppWidget.dart';
import 'package:vistech/snippets/socialLogins/OtpSignInScreen.dart';
import 'package:nb_utils/nb_utils.dart';

import 'components/OTPDialog.dart';

class LoginWithOTPScreen extends StatefulWidget {
  static String tag = '/LoginWithOTPScreen';

  @override
  LoginWithOTPScreenState createState() => LoginWithOTPScreenState();
}

class LoginWithOTPScreenState extends State<LoginWithOTPScreen> {
  bool mIsLoading = false;

  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  var phoneFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<void> getOTP(BuildContext context) async {
    String phone = phoneController.text.trim();

    if (phone.isEmpty) {
      toast(errorThisFieldRequired);

      FocusScope.of(context).requestFocus(phoneFocus);
    } else {
      phoneController.clear();
      mIsLoading = true;
      setState(() {});

      auth.verifyPhoneNumber(
        phoneNumber: '+$phone',
        verificationCompleted: (AuthCredential credential) async {
          auth.signOut();
          finish(context);

          UserCredential result = await auth.signInWithCredential(credential);

          setValue(IsLoggedInSocialLogin, true);
          User? user = result.user;

          OtpSignInScreen(user: user).launch(context);
        },
        verificationFailed: (FirebaseAuthException exception) {
          mIsLoading = false;
          setState(() {});

          toast(exception.toString());
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          mIsLoading = false;
          setState(() {});

          showInDialog(context, child: OTPDialog(verificationId), barrierDismissible: false);
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          mIsLoading = false;
          setState(() {});
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    logout();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AppStackLoader(
          visible: mIsLoading,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppTextField(
                    focus: phoneFocus,
                    controller: phoneController,
                    textFieldType: TextFieldType.PHONE,
                    decoration: inputDecoration(label: 'Mobile Number', prefixText: '+ '),
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                    autoFocus: true,
                    onFieldSubmitted: (v) {
                      getOTP(context);
                    },
                  ),
                  8.height,
                  Text('*Country code required', style: secondaryTextStyle()),
                  30.height,
                  AppButton(
                    onTap: () {
                      getOTP(context);
                    },
                    text: 'Login',
                    textStyle: primaryTextStyle(color: Colors.white),
                    color: appPrimaryColor,
                  ).center(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
