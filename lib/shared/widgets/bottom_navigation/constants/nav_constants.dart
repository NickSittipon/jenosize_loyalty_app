// shared/widgets/bottom_navigation/constants/nav_constants.dart

import 'package:flutter/material.dart';

class NavConstants {
  // Colors
  static const Color primaryColor = Color.fromRGBO(33, 150, 243, 1.0);
  static const Color secondaryColor = Color.fromRGBO(0, 188, 212, 1.0);
  static const MaterialColor inactiveColor = Colors.grey;
  static const Color inactiveIconColor = Color(0xFF9E9E9E); // grey.shade500
  static const Color inactiveTextColor = Color(0xFF757575); // grey.shade600
  static const Color backgroundColor = Colors.white;

  // Gradients
  static const LinearGradient activeGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [secondaryColor, primaryColor],
  );

  // Sizes
  static const double containerHeight = 70.0;
  static const double iconSize = 20.0;
  static const double iconPadding = 6.0;
  static const double borderRadius = 10.0;
  static const double indicatorWidth = 16.0;
  static const double indicatorHeight = 2.0;

  // Spacing
  static const EdgeInsets containerPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 6,
  );
  static const double itemSpacing = 3.0;
  static const double indicatorSpacing = 2.0;

  // Typography
  static const double fontSize = 11.0;
  static const FontWeight activeFontWeight = FontWeight.w600;
  static const FontWeight inactiveFontWeight = FontWeight.w500;

  // Animation
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const Curve animationCurve = Curves.easeInOut;

  // Shadows
  static List<BoxShadow> get containerShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      offset: const Offset(0, -5),
    ),
  ];

  static List<BoxShadow> get activeShadow => [
    BoxShadow(
      color: secondaryColor.withOpacity(0.3),
      blurRadius: 6,
      offset: const Offset(0, 3),
    ),
  ];
}
