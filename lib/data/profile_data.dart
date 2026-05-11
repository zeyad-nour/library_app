import 'package:flutter/material.dart';

final Map<String, dynamic> profileData = {
  "name": "Sarah Johnson",

  "email": "sarah@gmail.com",

  "image": "",

  "stats": [
    {"title": "Books", "value": "120"},
    {"title": "Reading", "value": "35"},
    {"title": "Favorites", "value": "18"},
  ],

  "menu": [
    {"title": "Dark Mode", "icon": Icons.dark_mode, "color": Colors.deepPurple},
    {
      "title": "Notifications",
      "icon": Icons.notifications,
      "color": Colors.orange,
    },
    {"title": "Logout", "icon": Icons.logout, "color": Colors.red},
  ],
};
