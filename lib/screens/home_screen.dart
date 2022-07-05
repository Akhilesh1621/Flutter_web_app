import 'package:app/config/fonts.dart';
import 'package:app/config/palette.dart';
import 'package:app/data/data.dart';
import 'package:app/widgets/contactlist.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:app/widgets/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TrackingScrollController _trackingScrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _trackingScrollController = TrackingScrollController();
  }

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreendesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenMobile({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
    );
  }
}

class _HomeScreendesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreendesktop({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
              // color: Colors.orange,
              ),
        ),
        const Spacer(),
        SizedBox(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
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
        ),
        const Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            )),
      ],
    );
  }
}
