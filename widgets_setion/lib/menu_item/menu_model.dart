import 'package:flutter/material.dart';
import 'package:widgets_setion/menu_item/menu_item.dart';

class MenuModel {
  static const List<MenuItem> menuListItem = [settingItem, infoItem, shareItem];
  static const settingItem =
      MenuItem(menuText: "Settings", menuIcon: Icons.settings);
  static const infoItem = MenuItem(menuText: "Info", menuIcon: Icons.info);
  static const shareItem = MenuItem(menuText: "Share", menuIcon: Icons.share);
}
