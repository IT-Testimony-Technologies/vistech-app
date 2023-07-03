import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vistech/ShoppingModule/home_screen.dart';
import 'package:vistech/TutorLocationModule/views/search_screen.dart';
import 'package:vistech/screens/course/course_home_screen.dart';
import 'package:vistech/screens/course/course_subject_screen.dart';
import 'package:vistech/theme/app_theme.dart';

import 'profile_screen.dart';

class EstateFullAppScreen extends StatefulWidget {
  const EstateFullAppScreen({Key? key}) : super(key: key);

  @override
  _EstateFullAppScreenState createState() => _EstateFullAppScreenState();
}

class _EstateFullAppScreenState extends State<EstateFullAppScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    FxTextStyle.changeFontFamily(GoogleFonts.quicksand);
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
    return Scaffold(
      body: FxBottomNavigationBar(
        activeTitleColor: customTheme.estatePrimary,
        activeContainerColor: customTheme.estatePrimary.withAlpha(50),
        fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
        containerShape: BoxShape.circle,
        showActiveLabel: false,
        showLabel: false,
        activeIconColor: customTheme.estatePrimary,
        iconColor: theme.colorScheme.onBackground.withAlpha(140),
        itemList: [
          FxBottomNavigationBarItem(
            page: CourseHomeScreen(),
            activeIconData: Icons.school,
            iconData: Icons.school_outlined,
            activeIconSize: 24,
            iconSize: 24,
          ),
          FxBottomNavigationBarItem(
            //page: EstateSearchScreen(),
            page: EstateSearchScreen(),
            activeIconData: Icons.search,
            iconData: Icons.search,
            activeIconSize: 24,
            iconSize: 24,
          ),
          FxBottomNavigationBarItem(
              page: CourseSubjectScreen(),
              activeIconData: Icons.library_books,
              iconData: Icons.library_books,
              activeIconSize: 22,
              iconSize: 24),
          FxBottomNavigationBarItem(
              page: ShoppingHomeScreen(),
              activeIconData: Icons.shop,
              iconData: Icons.shop,
              activeIconSize: 22,
              iconSize: 24),
          FxBottomNavigationBarItem(
            page: EstateProfileScreen(),
            activeIconData: Icons.person,
            iconData: Icons.person_outline,
            activeIconSize: 24,
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
