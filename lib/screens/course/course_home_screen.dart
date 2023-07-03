import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vistech/screens/course/course_details_screen.dart';
import 'package:vistech/theme/app_theme.dart';
import 'package:vistech/utils/generator.dart';

import 'course_exam_time_screen.dart';
import 'course_subject_screen.dart';

class CourseHomeScreen extends StatefulWidget {
  @override
  _CourseHomeScreenState createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  bool _noResults = false;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Dismissible(
          direction: DismissDirection.vertical,
          key: const Key('key'),
          onDismissed: (_) => Navigator.of(context).pop(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: FxSpacing.fromLTRB(24, 24, 24, 0),
                  child: FxText.bodyLarge("Learn",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: FxSpacing.fromLTRB(24, 16, 24, 16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: <Widget>[
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("topics")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (!streamSnapshot.hasData) {
                            return Center(
                              child: Container(
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                            );
                          }
                          final results = streamSnapshot.data?.docs;

                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10,
                            ),
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: results?.length,
                            itemBuilder: (context, index) => singleVideoLecture(
                                subject:
                                    "${streamSnapshot.data?.docs[index]['topic name']}",
                                topic_id: streamSnapshot.data?.docs[index]
                                    ['topic id'],
                                image:
                                    './assets/images/apps/course/purple-topicwp.png'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget singleVideoLecture(
      {required String subject, required int topic_id, required String image}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CourseDetailsScreen(topic_id: topic_id)));
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              height: (MediaQuery.of(context).size.width - 66) / 2,
              width: (MediaQuery.of(context).size.width - 66) / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image(
                image: AssetImage(image),
                height: (MediaQuery.of(context).size.width - 74) / 2,
                width: (MediaQuery.of(context).size.width - 74) / 2,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: FxText(subject,
                        color: Colors.white, fontWeight: 800, fontSize: 14),
                  ),
                  Container(
                    margin: FxSpacing.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: theme.colorScheme.background,
                              shape: BoxShape.circle),
                          child: Icon(
                            MdiIcons.play,
                            color: theme.colorScheme.onBackground,
                            size: 18,
                          ),
                        ),
                        Container(
                          margin: FxSpacing.only(left: 8),
                          child: FxText.bodyLarge(topic_id.toString(),
                              color: theme.colorScheme.background,
                              fontWeight: 600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget examWidget() {
    return FxContainer.bordered(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamTimeScreen()));
      },
      borderRadiusAll: 4,
      padding: FxSpacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FxText.titleMedium("Test yourself",
                fontWeight: 700, color: theme.colorScheme.onBackground),
          ),
          Container(
            margin: FxSpacing.top(8),
            child: FxText.bodyMedium(Generator.getDummyText(8),
                color: theme.colorScheme.onBackground.withAlpha(160),
                height: 1.2),
          ),
          Container(
            margin: FxSpacing.top(16),
            padding: FxSpacing.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(28),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: FxText.bodyMedium("Time Table",
                letterSpacing: 0.3,
                color: theme.colorScheme.primary,
                fontWeight: 600),
          ),
        ],
      ),
    );
  }

  Widget singleMyCourse(
      {required String image,
      required String title,
      required String subtitle,
      required String status,
      required double progress}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseSubjectScreen()));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image(
                image: AssetImage(image),
                height: 60,
                width: 60,
              ),
            ),
            Expanded(
              child: Container(
                margin: FxSpacing.left(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FxText.bodyMedium(subtitle,
                        color: theme.colorScheme.primary.withAlpha(180),
                        fontWeight: 700),
                    FxText.bodyLarge(
                      title,
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      fontWeight: 600,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: FxText.bodyMedium(
                            status,
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FxProgressBar(
                            progress: progress,
                            height: 4,
                            activeColor: customTheme.colorSuccess,
                            inactiveColor:
                                theme.colorScheme.onBackground.withAlpha(80),
                            width: 56)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
