import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:vistech/theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  Color randomColor() {
    var random = new Random();
    var next = random.nextInt(2);
    if (next == 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  int generateRandomRating() {
    final _random = new Random();
    return _random.nextInt(5) + 1;
  }

  List<String> imageUrls = [
    'https://pbs.twimg.com/profile_images/1588104627895107584/tipSaPN3_400x400.jpg',
    'https://pbs.twimg.com/media/Fl9U0O9aYAA3mKU?format=jpg&name=large',
    'https://pbs.twimg.com/profile_images/1613877082714701826/_Z3oBV6l_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1585790681561415681/xek9guP9_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1563200675521204224/gQqca_VQ_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1603677304454012929/DIH5yJTI_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1611507124315607042/a6mxTu9E_400x400.jpg',
    'https://pbs.twimg.com/media/Fl0d38nXEAA0AEV?format=jpg&name=medium',
    'https://pbs.twimg.com/profile_images/1603036811353358337/1vgn_Dxi_400x400.jpg',
    'https://pbs.twimg.com/media/Fmlp4Q0agAATjFP?format=jpg&name=small',
    'https://pbs.twimg.com/profile_images/1588104627895107584/tipSaPN3_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1613787751442169858/qJHuP6EP_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1183011023202029569/mNOTZ4Wt_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1525274841460445185/5qJq3TmA_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1387065127208247299/bni08CVZ_400x400.jpg',
    'https://pbs.twimg.com/profile_images/1599831054881374224/sx4KqXNX_400x400.jpg'
  ];
  String randomImages() {
    return imageUrls[Random().nextInt(imageUrls.length)];
  }

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late String _searchQuery;
  bool _noResults = false;
  _SearchScreenState() {
    _searchQuery = "";
  }
  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        FxContainer(
          paddingAll: 8,
          borderRadiusAll: 4,
          color: theme.colorScheme.onBackground.withAlpha(20),
          child: Icon(
            icon,
            color: customTheme.estatePrimary,
            size: 20,
          ),
        ),
        FxSpacing.width(16),
        Expanded(
          child: FxText.bodySmall(
            title!,
            letterSpacing: 0.5,
          ),
        ),
        FxSpacing.width(16),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container()),
    );
  }
}
