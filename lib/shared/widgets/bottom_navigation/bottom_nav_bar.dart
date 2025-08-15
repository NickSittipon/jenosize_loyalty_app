// shared/widgets/bottom_navigation/bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:jenosize_test/app/routes/route_names.dart';
import 'models/nav_item_model.dart';
import 'widgets/nav_item_widget.dart';
import 'constants/nav_constants.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int index) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;

  // Configuration moved to constants and separated
  static const List<NavItemModel> _navItems = [
    NavItemModel(
      icon: Icons.campaign_outlined,
      activeIcon: Icons.campaign,
      label: 'Campaigns',
      routeName: RoutesName.campaigns,
    ),
    NavItemModel(
      icon: Icons.card_membership_outlined,
      activeIcon: Icons.card_membership,
      label: 'Membership',
      routeName: RoutesName.membership,
    ),
    NavItemModel(
      icon: Icons.share_outlined,
      activeIcon: Icons.share,
      label: 'Refer',
      routeName: RoutesName.refer,
    ),
    NavItemModel(
      icon: Icons.star_outline,
      activeIcon: Icons.star,
      label: 'Points',
      routeName: RoutesName.points,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _animationControllers[widget.currentIndex].forward();
  }

  @override
  void didUpdateWidget(BottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _updateAnimations(oldWidget.currentIndex, widget.currentIndex);
    }
  }

  @override
  void dispose() {
    _disposeAnimations();
    super.dispose();
  }

  void _initializeAnimations() {
    _animationControllers = List.generate(
      _navItems.length,
      (index) => AnimationController(
        duration: NavConstants.animationDuration,
        vsync: this,
      ),
    );

    _animations = _animationControllers
        .map(
          (controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: controller,
              curve: NavConstants.animationCurve,
            ),
          ),
        )
        .toList();
  }

  void _updateAnimations(int oldIndex, int newIndex) {
    _animationControllers[oldIndex].reverse();
    _animationControllers[newIndex].forward();
  }

  void _disposeAnimations() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
  }

  void _onTap(NavItemModel item, int index) {
    if (ModalRoute.of(context)?.settings.name != item.routeName) {
      Navigator.pushReplacementNamed(context, item.routeName);
      widget.onTap(index);
    }
  }

  bool _isItemActive(NavItemModel item) {
    return ModalRoute.of(context)?.settings.name == item.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NavConstants.backgroundColor,
        boxShadow: NavConstants.containerShadow,
      ),
      child: SafeArea(
        child: Container(
          height: NavConstants.containerHeight,
          padding: NavConstants.containerPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildNavItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return List.generate(_navItems.length, (index) {
      final item = _navItems[index];
      return Flexible(
        fit: FlexFit.tight,
        child: NavItemWidget(
          item: item,
          isActive: _isItemActive(item),
          animation: _animations[index],
          onTap: () => _onTap(item, index),
        ),
      );
    });
  }
}
