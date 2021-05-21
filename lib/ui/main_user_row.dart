import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interview_project_202105/ui/main_user_card.dart';

Widget userRow(BuildContext context, Map userData) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) => userCard(context, userData));
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              child: Text(userData['initials']),
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              userData['name'],
              style: TextStyle(fontSize: 24),
            ),
            Text(userData['email'], style: TextStyle(fontSize: 20)),
          ])
        ],
      ),
    ),
  );
}
