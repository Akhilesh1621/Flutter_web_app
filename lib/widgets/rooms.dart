import 'package:app/config/fonts.dart';
import 'package:app/config/palette.dart';

import 'package:app/models/models.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Rooms extends StatelessWidget {
  final List onlineUsers;
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _createRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  const _createRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
              color: Colors.blueAccent.shade100,
              width: 5.0,
            ),
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text('Create\nRoom',
                style: para.copyWith(
                  fontSize: 12.0,
                  color: Palette.facebookBlue,
                )),
          ),
        ],
      ),
    );
  }
}
