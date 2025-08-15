// shared/widgets/bottom_navigation/widgets/nav_label_widget.dart

import 'package:flutter/material.dart';
import '../constants/nav_constants.dart';

class NavLabelWidget extends StatelessWidget {
  final String label;
  final bool isActive;

  const NavLabelWidget({
    super.key,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AnimatedDefaultTextStyle(
        duration: NavConstants.animationDuration,
        style: TextStyle(
          fontSize: NavConstants.fontSize,
          fontWeight: isActive
              ? NavConstants.activeFontWeight
              : NavConstants.inactiveFontWeight,
          color: isActive
              ? NavConstants.primaryColor
              : NavConstants.inactiveColor.shade600,
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
