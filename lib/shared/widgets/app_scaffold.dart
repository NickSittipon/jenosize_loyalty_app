import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'package:jenosize_test/app/routes/app_router.dart';

class AppScaffold extends StatefulWidget {
  final int currentIndex;
  final Widget body;
  final String? title;

  const AppScaffold({
    super.key,
    required this.currentIndex,
    required this.body,
    this.title,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void _onTap(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.campaigns);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.membership);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.refer);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.points);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title != null
            ? Text(
                widget.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              )
            : null,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(color: Colors.black87),
      ),
      body: widget.body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: BottomNavBar(currentIndex: _currentIndex, onTap: _onTap),
      ),
    );
  }
}
