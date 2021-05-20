import 'package:flutter/material.dart';

Widget userRow = Padding(
  padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
  child: Row(
    children: [
      CircleAvatar(child: Text("LG")),
      SizedBox(width: 32),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(
          "Leanne Graham",
          style: TextStyle(fontSize: 24),
        ),
        Text("Sincere@april.biz", style: TextStyle(fontSize: 20)),
      ])
    ],
  ),
);
