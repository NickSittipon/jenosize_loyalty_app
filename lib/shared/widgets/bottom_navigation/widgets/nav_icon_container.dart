// shared/widgets/bottom_navigation/widgets/nav_icon_container.dart

import 'package:flutter/material.dart';
import '../models/nav_item_model.dart';
import '../constants/nav_constants.dart';

class NavIconContainer extends StatelessWidget {
  final NavItemModel item;
  final bool isActive;

  const NavIconContainer({
    super.key,
    required this.item,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(NavConstants.iconPadding),
      decoration: BoxDecoration(
        gradient: isActive ? NavConstants.activeGradient : null,
        color: isActive ? null : Colors.transparent,
        borderRadius: BorderRadius.circular(NavConstants.borderRadius),
        boxShadow: isActive ? NavConstants.activeShadow : null,
      ),
      child: AnimatedScale(
        scale: isActive ? 1.0 : 0.9,
        duration: NavConstants.animationDuration,
        child: Icon(
          isActive ? item.activeIcon : item.icon,
          color: isActive ? Colors.white : NavConstants.inactiveColor.shade500,
          size: NavConstants.iconSize,
        ),
      ),
    );
  }
}
