import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vistech/screens/HomeScreen.dart';

class CreateAccount extends StatefulWidget {
  //final BuildContext context;
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  Future<void> _signInAccount(String email, String password) async {
    try {
      final firebaseUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(firebaseUser);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      Alert(
              context: context,
              type: AlertType.error,
              title: "Error",
              desc: "Email and Password don't match")
          .show();
      print(e);
    }
  }

  Future<void> _createAccount(String email, String password) async {
    try {
      final List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (signInMethods.isNotEmpty) {
        _signInAccount(email, password);
        return;
      }
      final firebaseUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(firebaseUser);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> _signInWithGoogle(
      {required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Welcome"),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email here',
                        labelText: 'Email'),
                    onChanged: (value) => _email = value,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password here',
                        labelText: 'Password'),
                    onChanged: (value) => _password = value,
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      child: Text('Continue'),
                      onPressed: () => _createAccount(_email, _password),
                    )),
                Divider(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('or continue with Google'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      GestureDetector(
                          onTap: () {
                            _signInWithGoogle(context: context);
                          },
                          child: Icon(Icons.mail)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
