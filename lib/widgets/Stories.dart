import 'dart:ui';

import 'package:app/config/fonts.dart';
import 'package:app/config/palette.dart';
import 'package:app/data/data.dart';
import 'package:app/models/models.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List stories;
  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(story: story),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;
  const _StoryCard({this.isAddStory = false, this.currentUser, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => print('create story'),
                    icon: const Icon(
                      Icons.add,
                    ),
                    iconSize: 30.0,
                    color: Palette.facebookBlue,
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.user.imageUrl,
                  hasBorder: !story!.isViewed,
                ),
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? 'Add to Story' : story!.user.name,
              style: headline.copyWith(
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }
}
