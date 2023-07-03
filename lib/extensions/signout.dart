import 'package:firebase_auth/firebase_auth.dart';

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}
