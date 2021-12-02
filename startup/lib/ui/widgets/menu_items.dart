import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemSettings,
    itemEditProfile,
  ];

  static const List<MenuItem> itemsSecond = [
    itemLogOut,
  ];

  static const itemSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );
  static const itemEditProfile = MenuItem(
    text: 'Edit Profile',
    icon: Icons.edit,
  );
  static const itemLogOut = MenuItem(
    text: 'Log Out',
    icon: Icons.logout,
  );
}
