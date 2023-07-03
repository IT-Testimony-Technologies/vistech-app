import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vistech/theme/app_theme.dart';
import 'package:vistech/utils/generator.dart';

class CourseDetailsScreen extends StatefulWidget {
  int topic_id;

  CourseDetailsScreen({required this.topic_id});
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  bool isFav = false, isBookmark = false;

  late String _descText;

  @override
  void initState() {
    super.initState();
    _descText = Generator.getDummyText(24, withTab: true);
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: <Widget>[
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("titles")
              .where("topic id", isEqualTo: widget.topic_id)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            print(widget.topic_id);
            if (!streamSnapshot.hasData) {
              return Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    Container(
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              );
            } else if (streamSnapshot.data!.docs.isEmpty) {
              // No data found
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              final results = streamSnapshot.data!.docs;
              results.forEach((doc) {
                final topicId = doc['topic id'];
                print('Topic ID: $topicId');
              });
              print(results);
              return Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
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
                              Container(
                                padding: FxSpacing.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: customTheme.colorInfo,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: FxText.bodySmall(
                                  "Trending",
                                  color: customTheme.onInfo,
                                  letterSpacing: 0,
                                  fontWeight: 500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    )));
  }

  Widget singleContent(
      {required String index,
      required String time,
      required String title,
      bool enabled = true}) {
    return Container(
      margin: FxSpacing.bottom(24),
      child: Row(
        children: <Widget>[
          FxText.headlineSmall(index,
              color: theme.colorScheme.onBackground.withAlpha(80),
              fontWeight: 600),
          Expanded(
            child: Container(
              margin: FxSpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium(time,
                      color: theme.colorScheme.onBackground, muted: true),
                  FxText.titleMedium(
                    title,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: enabled ? 1 : 0.7,
            child: Container(
              margin: FxSpacing.left(16),
              padding: FxSpacing.all(8),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary, shape: BoxShape.circle),
              child: Icon(
                MdiIcons.play,
                color: theme.colorScheme.onPrimary,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
