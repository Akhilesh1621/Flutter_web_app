import 'package:app/config/fonts.dart';
import 'package:app/config/palette.dart';
import 'package:app/models/models.dart';
import 'package:app/widgets/TextButton.dart';
import 'package:app/widgets/customTabBar.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final User currentUser;

  const CustomAppBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black54,
          offset: Offset(0, 2),
          blurRadius: 4.0,
        )
      ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(
            'facebook',
            style: titleHeading.copyWith(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              letterSpacing: -1.2,
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: 600.0,
          child: CustomTabBar(
            icons: icons,
            onTap: onTap,
            selectedIndex: selectedIndex,
            isBottomIndicator: true,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),

              const SizedBox(
                width: 12.0,
              ),
              // Text(currentUser.name),
              // these are custom created  widgets
              CircleButton(
                icon: Icons.search,
                iconSize: 20.0,
                onPressed: () => print('search'),
                iconColor: Colors.black,
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 20.0,
                onPressed: () => print('messenger'),
                iconColor: Colors.black,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
