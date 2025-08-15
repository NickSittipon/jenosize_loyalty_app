// shared/widgets/bottom_navigation/models/nav_item_model.dart

import 'package:flutter/material.dart';

class NavItemModel {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String routeName;

  const NavItemModel({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.routeName,
  });
}
