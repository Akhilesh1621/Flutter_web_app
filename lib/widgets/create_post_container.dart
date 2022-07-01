import 'package:app/widgets/profile_avatar.dart';
import 'package:app/widgets/widgets.dart';

import 'package:flutter/material.dart';

import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(children: [
        Row(
          children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl),
            const SizedBox(
              width: 8.0,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'what\s on your mind',
                ),
              ),
            )
          ],
        ),
        const Divider(
          height: 10.0,
          thickness: 0.5,
        ),
        SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Textbutton(
                color: Colors.red,
                icon: Icons.videocam,
                onPressed: () {},
                text: 'Live',
              ),
              const VerticalDivider(
                width: 8.0,
              ),
              Textbutton(
                color: Colors.green,
                icon: Icons.photo_library,
                onPressed: () {},
                text: 'Photo',
              ),
              const VerticalDivider(
                width: 8.0,
              ),
              Textbutton(
                color: Colors.purpleAccent,
                icon: Icons.video_call,
                onPressed: () {},
                text: 'Room',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
