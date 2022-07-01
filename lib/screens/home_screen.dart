import 'package:app/config/fonts.dart';
import 'package:app/config/palette.dart';
import 'package:app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              // title heading is actully a font which is taken from font.dart file
              style: titleHeading.copyWith(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  letterSpacing: -1.2),
            ),
            floating: true,
            actions: [
              // these are custom created  widgets
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print('search'),
                iconColor: Colors.black,
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print('messenger'),
                iconColor: Colors.black,
              ),
            ],
          ),
          // SliverTo box is to make a box in sliver , so container should be warpped in sliverto box widget
          // also other slivers SliverPadding, SliverList, SliverGrid
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
        ],
      ),
    );
  }
}
