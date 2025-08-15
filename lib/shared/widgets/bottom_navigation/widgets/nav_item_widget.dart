// shared/widgets/bottom_navigation/widgets/nav_item_widget.dart

import 'package:flutter/material.dart';
import '../models/nav_item_model.dart';
import '../constants/nav_constants.dart';
import 'nav_icon_container.dart';
import 'nav_label_widget.dart';
import 'nav_active_indicator.dart';

class NavItemWidget extends StatelessWidget {
  final NavItemModel item;
  final bool isActive;
  final Animation<double> animation;
  final VoidCallback onTap;

  const NavItemWidget({
    super.key,
    required this.item,
    required this.isActive,
    required this.animation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavIconContainer(item: item, isActive: isActive),
              const SizedBox(height: NavConstants.itemSpacing),
              NavLabelWidget(label: item.label, isActive: isActive),
              const SizedBox(height: NavConstants.indicatorSpacing),
              NavActiveIndicator(isActive: isActive),
            ],
          );
        },
      ),
    );
  }
}
