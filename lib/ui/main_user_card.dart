import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

AlertDialog userCard(BuildContext context, Map userData) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
            child: Text(userData['initials']),
            backgroundColor:
                Colors.primaries[Random().nextInt(Colors.primaries.length)]),
        SizedBox(height: 8),
        Text(
          userData['name'],
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 8),
        Text(userData['email']),
        SizedBox(height: 8),
        Text(userData['address']),
        TextButton.icon(
          icon: Icon(Icons.phone),
          label: Text(userData['phone']),
          onPressed: () {
            UrlLauncher.launch("tel://${userData['phone']}");
          },
        ),
      ],
    ),
    actions: [
      OutlinedButton(
        child: const Text('Make a call'),
        onPressed: () {
          UrlLauncher.launch("tel://${userData['phone']}");
        },
      ),
      OutlinedButton(
        child: const Text('Close'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
}
