import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vistech/eStudy/utils/ESCommon.dart';
import 'package:vistech/main/components/AppBarScoller.dart';
import 'package:vistech/main/services/FirebaseUserService.dart';
import 'package:vistech/main/utils/AppColors.dart';
import 'package:vistech/snippets/firebaseCRUD/model/FBUserModel.dart';

class FirebaseUpdateDelete extends StatefulWidget {
  static String tag = '/FirebaseUpdateDelete';
  final FBUserModel? user;

  FirebaseUpdateDelete({this.user});

  @override
  FirebaseUpdateDeleteState createState() => FirebaseUpdateDeleteState();
}

class FirebaseUpdateDeleteState extends State<FirebaseUpdateDelete> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userEmail = TextEditingController();
  TextEditingController userFullName = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  FirebaseUserService user = FirebaseUserService();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    userEmail = TextEditingController(text: widget.user!.email);
    userFullName = TextEditingController(text: widget.user!.fullName);
    userPassword = TextEditingController(text: widget.user!.password);
  }

  @override
  void dispose() {
    userEmail.dispose();
    userFullName.dispose();
    userPassword.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarScroller(
        title: 'User Data',
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: userFullName,
                        decoration: inputDecoration(context, hint: 'Full Name'),
                        textFieldType: TextFieldType.NAME,
                        keyboardType: TextInputType.text,
                      ),
                      16.height,
                      AppTextField(
                        controller: userEmail,
                        keyboardType: TextInputType.emailAddress,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: inputDecoration(context, hint: 'Email'),
                      ),
                      16.height,
                      AppTextField(
                        controller: userPassword,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration(context, hint: 'Password'),
                        textFieldType: TextFieldType.PASSWORD,
                      ),
                      16.height,
                      AppButton(
                        color: appPrimaryColor,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            user.updateDocument({
                              'email': userEmail.text,
                              'fullName': userFullName.text,
                              'password': userPassword.text
                            }, widget.user!.id).then((value) {
                              toast("Update data successfully");
                            }).catchError((error) {
                              toast(error.toString());
                            });
                          }
                        },
                        child: Text("Update",
                            style: boldTextStyle(color: Colors.white)),
                      ),
                      8.height,
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.black),
                        onPressed: () async {
                          user.removeDocument(widget.user!.id).then((value) {
                            toast("Document deleted");

                            finish(context);
                          }).catchError((error) {
                            toast(error.toString());
                          });
                        },
                      )
                    ],
                  ),
                ).paddingAll(16)
              ],
            ),
          ).center(),
        ),
      ),
    );
  }
}
