import 'package:flutter/material.dart';
import 'package:jenosize_test/app/routes/route_names.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required void Function(int index) onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;

  final List<NavItem> _navItems = [
    NavItem(
      icon: Icons.campaign_outlined,
      activeIcon: Icons.campaign,
      label: 'Campaigns',
      routeName: RoutesName.campaigns,
    ),
    NavItem(
      icon: Icons.card_membership_outlined,
      activeIcon: Icons.card_membership,
      label: 'Membership',
      routeName: RoutesName.membership,
    ),
    NavItem(
      icon: Icons.share_outlined,
      activeIcon: Icons.share,
      label: 'Refer',
      routeName: RoutesName.refer,
    ),
    NavItem(
      icon: Icons.star_outline,
      activeIcon: Icons.star,
      label: 'Points',
      routeName: RoutesName.points,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
      _navItems.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      ),
    );
    _animations = _animationControllers
        .map(
          (controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          ),
        )
        .toList();

    // เริ่มต้น animation สำหรับ tab ที่ active
    _animationControllers[widget.currentIndex].forward();
  }

  @override
  void didUpdateWidget(BottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _animationControllers[oldWidget.currentIndex].reverse();
      _animationControllers[widget.currentIndex].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTap(NavItem item) {
    if (ModalRoute.of(context)?.settings.name != item.routeName) {
      Navigator.pushReplacementNamed(context, item.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navItems.length, (index) {
              return Flexible(
                fit: FlexFit.tight,
                child: _buildNavItem(_navItems[index], index),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(NavItem item, int index) {
    final isActive = ModalRoute.of(context)?.settings.name == item.routeName;

    return GestureDetector(
      onTap: () => _onTap(item),
      child: AnimatedBuilder(
        animation: _animations[index],
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Container with Background
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  gradient: isActive
                      ? const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(0, 188, 212, 1.0),
                            Color.fromRGBO(33, 150, 243, 1.0),
                          ],
                        )
                      : null,
                  color: isActive ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 188, 212, 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : null,
                ),
                child: AnimatedScale(
                  scale: isActive ? 1.0 : 0.9,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    isActive ? item.activeIcon : item.icon,
                    color: isActive ? Colors.white : Colors.grey.shade500,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              // Label
              Flexible(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive
                        ? const Color.fromRGBO(33, 150, 243, 1.0)
                        : Colors.grey.shade600,
                  ),
                  child: Text(
                    item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              // Active Indicator
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isActive ? 16 : 0,
                height: 2,
                decoration: BoxDecoration(
                  gradient: isActive
                      ? const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(0, 188, 212, 1.0),
                            Color.fromRGBO(33, 150, 243, 1.0),
                          ],
                        )
                      : null,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String routeName; // เพิ่ม routeName

  NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.routeName,
  });
}
