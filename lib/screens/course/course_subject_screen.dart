import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vistech/screens/course/course_details_screen.dart';
import 'package:vistech/screens/course/course_exam_screen.dart';
import 'package:vistech/screens/course/course_profile_screen.dart';
import 'package:vistech/screens/course/course_tasks_screen.dart';
import 'package:vistech/screens/course/course_video_screen.dart';
import 'package:vistech/screens/quiz/quiz_customize_screen.dart';
import 'package:vistech/theme/app_theme.dart';

class CourseSubjectScreen extends StatefulWidget {
  @override
  _CourseSubjectScreenState createState() => _CourseSubjectScreenState();
}

class _CourseSubjectScreenState extends State<CourseSubjectScreen> {
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
        body: Container(
            color: customTheme.card,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  padding: FxSpacing.fromLTRB(36, 48, 36, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            MdiIcons.chevronLeft,
                            color: theme.colorScheme.onPrimary,
                            size: 24,
                          ),
                        ),
                      ),
                      Container(
                        margin: FxSpacing.top(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FxText.headlineSmall("AI Study Quide",
                                    fontWeight: 700,
                                    color: theme.colorScheme.onPrimary),
                                FxText.bodyLarge("Study with us",
                                    fontWeight: 500,
                                    color: theme.colorScheme.onPrimary),
                              ],
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                                child: Image(
                                    image: AssetImage(
                                        './assets/images/profile/avatar_2.jpg'),
                                    width: 48,
                                    height: 48),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: FxSpacing.top(24),
                        child: FxText.bodyLarge("60 courses",
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 500),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: FxSpacing.zero,
                      children: <Widget>[
                        Container(
                          padding: FxSpacing.fromLTRB(20, 20, 20, 0),
                          margin: FxSpacing.top(16),
                          child: FxText.titleMedium("Resources",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Container(
                          child: GridView.count(
                            physics: ClampingScrollPhysics(),
                            crossAxisCount: 2,
                            padding: FxSpacing.fromLTRB(20, 20, 20, 16),
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                            shrinkWrap: true,
                            childAspectRatio: 1,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseProfileScreen()),
                                  );
                                },
                                child: singleResource(
                                    title: "All",
                                    isSelected: true,
                                    resource: "14 Files"),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseVideoScreen()),
                                  );
                                },
                                child: singleResource(
                                    title: "Lectures",
                                    iconData: MdiIcons.fileVideoOutline,
                                    resource: "3 Videos"),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseDetailsScreen(topic_id: 1)),
                                  );
                                },
                                child: singleResource(
                                    title: "Reading Material",
                                    isSelected: false,
                                    iconData: MdiIcons.filePdfOutline,
                                    resource: "3 PDFs"),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CourseTasksScreen()),
                                  );
                                },
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CourseExamScreen()),
                                    );
                                  },
                                  child: singleResource(
                                      title: "Assignment",
                                      isSelected: false,
                                      iconData: MdiIcons.fileEditOutline,
                                      resource: "3 Lessons"),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuizCustomizeScreen()),
                                  );
                                },
                                child: singleResource(
                                    title: "Quizes",
                                    isSelected: false,
                                    resource: "3 Task"),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ],
            )));
  }

  Widget singleResource(
      {required String title,
      required String resource,
      bool isSelected = false,
      IconData iconData = MdiIcons.fileOutline}) {
    return FxContainer(
      padding: FxSpacing.all(16),
      color: isSelected ? theme.colorScheme.primary : customTheme.card,
      bordered: !isSelected,
      borderRadiusAll: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FxText.titleMedium(title,
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground,
              fontWeight: 600),
          Row(
            children: <Widget>[
              Container(
                child: Icon(
                  iconData,
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onBackground,
                  size: 18,
                ),
              ),
              Container(
                margin: FxSpacing.left(4),
                child: FxText.bodySmall(
                  resource,
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onBackground,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
