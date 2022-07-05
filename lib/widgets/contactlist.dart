import 'package:app/config/fonts.dart';
import 'package:app/data/data.dart';
import 'package:app/widgets/usercard.dart';

import 'package:flutter/material.dart';

import '../models/models.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;
  const ContactsList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: headline.copyWith(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Icon(
                Icons.more_horiz,
                color: Colors.grey,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: UserCard(user: user),
                  );
                }),
          )
        ],
      ),
    );
  }
}
