import 'package:app/config/fonts.dart';
import 'package:app/config/palette.dart';
import 'package:app/data/data.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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
          const SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
