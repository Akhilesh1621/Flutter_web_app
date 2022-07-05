import 'package:app/config/fonts.dart';
import 'package:app/data/data.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(
            width: 6.0,
          ),
          Text(
            user.name,
            style: titleHeading.copyWith(
              fontSize: 16.0,
              color: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}
