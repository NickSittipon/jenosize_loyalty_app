// shared/widgets/bottom_navigation/widgets/nav_active_indicator.dart

import 'package:flutter/material.dart';
import '../constants/nav_constants.dart';

class NavActiveIndicator extends StatelessWidget {
  final bool isActive;

  const NavActiveIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: NavConstants.animationDuration,
      width: isActive ? NavConstants.indicatorWidth : 0,
      height: NavConstants.indicatorHeight,
      decoration: BoxDecoration(
        gradient: isActive ? NavConstants.activeGradient : null,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
