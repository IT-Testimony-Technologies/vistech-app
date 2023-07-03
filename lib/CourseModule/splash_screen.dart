import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vistech/TutorLocationModule/views/full_app_screen.dart';
import 'package:vistech/TutorLocationModule/views/login_screen.dart';
import 'package:vistech/theme/app_notifier.dart';
import 'package:vistech/theme/app_theme.dart';

class CookifySplashScreen extends StatefulWidget {
  @override
  _CookifySplashScreenState createState() => _CookifySplashScreenState();
}

class _CookifySplashScreenState extends State<CookifySplashScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    FxTextStyle.changeFontFamily(GoogleFonts.mali);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      theme = AppTheme.theme;
      customTheme = AppTheme.customTheme;

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
            colorScheme: theme.colorScheme
                .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
        home: Scaffold(
          body: Container(
            margin: FxSpacing.fromLTRB(24, 100, 24, 32),
            child: Column(
              children: [
                FxText.displaySmall(
                  "WELCOME TO FOREX SOMO",
                  fontWeight: 800,
                  fontSize: 20,
                  style: TextStyle(
                      fontFamily: 'Arial',
                      color: Colors.deepPurpleAccent,
                      fontSize: 20),
                  color: Colors.deepPurpleAccent,
                ),
                Expanded(
                  child: Center(
                    child: Image(
                      image: AssetImage(
                          './assets/images/apps/estate/Analytics_animation.gif'),
                      width: 320,
                    ),
                  ),
                ),
                Row(
                  children: [
                    /** Expanded(
                        child: FxButton.text(
                      splashColor: customTheme.cookifyPrimary.withAlpha(40),
                      padding: FxSpacing.y(12),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => CookifyRegisterScreen()),
                        );
                      },
                      child: FxText.labelLarge(
                        "SIGN UP",
                        color: customTheme.cookifyPrimary,
                        letterSpacing: 0.5,
                      ),
                    )),**/
                    Expanded(
                        child: FxButton(
                      elevation: 0,
                      padding: FxSpacing.y(12),
                      borderRadiusAll: 4,
                      onPressed: () {
                        // if user already logged in, advance to HomeScreen,but if not advance to LoginScreen
                        auth.authStateChanges().listen((User? user) {
                          if (user == null) {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => EstateLoginScreen()),
                            );
                          } else {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => EstateFullAppScreen()),
                            );
                          }
                        });
                      },
                      child: FxText.labelLarge(
                        "CONTINUE",
                        color: customTheme.cookifyOnPrimary,
                        letterSpacing: 0.5,
                      ),
                      backgroundColor: Colors.deepPurpleAccent,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
