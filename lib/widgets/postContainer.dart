import 'package:app/config/palette.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:app/widgets/responsive.dart';
import 'package:app/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/fonts.dart';
import '../models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 0.0, vertical: 5.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFFFFFFF), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        )
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl!,
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

// Post Header private class
class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: headline,
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} * ',
                    style: headline.copyWith(
                        color: Colors.grey[600], fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

//Post stats private class

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Textbutton(
              onPressed: () {},
              color: Palette.facebookBlue,
              icon: Icons.thumb_up,
              text: post.likes,
              colors: Colors.blueGrey,
            ),
            Row(
              children: [
                Text(
                  '${post.comments} Comments',
                  style: const TextStyle(
                    color: Color(0xFF7E7B7B),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${post.shares} Shares',
                  style: const TextStyle(
                    color: Color(0xFF7E7B7B),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareAllOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Share',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function() onTap;
  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              icon,
              const SizedBox(
                width: 4.0,
              ),
              Text(label),
            ]),
          ),
        ),
      ),
    );
  }
}
