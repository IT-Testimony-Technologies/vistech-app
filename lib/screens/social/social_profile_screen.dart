import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vistech/theme/app_theme.dart';

import 'social_profile_detail_screen.dart';

class SocialProfileScreen extends StatefulWidget {
  const SocialProfileScreen(
      {Key? key,
      required this.tutorname,
      required this.tutorprofileimage,
      required this.tutorrating})
      : super(key: key);
  final String tutorname;
  final String tutorprofileimage;
  final int tutorrating;

  @override
  _SocialProfileScreenState createState() => _SocialProfileScreenState();
}

class _SocialProfileScreenState extends State<SocialProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image(
          image: NetworkImage(widget.tutorprofileimage),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: FxSpacing.safeAreaTop(context) + 20,
          left: 24,
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                size: 24,
                color: Colors.black,
              )),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withAlpha(220),
              Colors.black.withAlpha(160),
              Colors.black.withAlpha(100),
              Colors.black.withAlpha(0)
            ], stops: [
              0.25,
              0.5,
              0.75,
              1
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            padding: FxSpacing.fromLTRB(24, 56, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.headlineSmall(widget.tutorname,
                    color: Colors.white, fontWeight: 700),
                FxText.bodyMedium("Piano and Guitar Tutor",
                    color: Colors.white, muted: true, fontWeight: 500),
                Container(
                  margin: FxSpacing.top(24),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            FxText.titleMedium("125",
                                color: Colors.white, fontWeight: 600),
                            Container(
                              margin: FxSpacing.top(4),
                              child: FxText.bodyMedium("Courses",
                                  color: Colors.white,
                                  muted: true,
                                  fontWeight: 400),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: [
                            FxText.titleMedium("250",
                                color: Colors.white, fontWeight: 600),
                            Container(
                              margin: FxSpacing.top(4),
                              child: FxText.bodyMedium("Certificates",
                                  color: Colors.white,
                                  muted: true,
                                  fontWeight: 400),
                            ),
                          ],
                        ),
                        VerticalDivider(),
                        Column(
                          children: [
                            FxText.titleMedium(widget.tutorrating.toString(),
                                color: Colors.white, fontWeight: 600),
                            Container(
                              margin: FxSpacing.top(4),
                              child: FxText.bodyMedium("Rating",
                                  color: Colors.white,
                                  muted: true,
                                  fontWeight: 400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: FxSpacing.top(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  FxSpacing.xy(16, 0))),
                          onPressed: () {},
                          child: FxText.bodyMedium("Subscribe",
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SocialProfileDetailScreen(
                                        tutorname: widget.tutorname,
                                        tutorprofileimage:
                                            widget.tutorprofileimage,
                                        tutorrating: widget.tutorrating,
                                      )));
                        },
                        child: Container(
                            margin: FxSpacing.left(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(120),
                              shape: BoxShape.circle,
                            ),
                            padding: FxSpacing.all(4),
                            child: Icon(
                              MdiIcons.arrowRight,
                              size: 20,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
