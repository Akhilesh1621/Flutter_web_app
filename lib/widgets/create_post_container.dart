import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(currentUser.imageUrl),
            )
          ],
        ),
      ]),
    );
  }
}
