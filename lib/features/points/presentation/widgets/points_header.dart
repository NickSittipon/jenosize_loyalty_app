import 'package:flutter/material.dart';

class PointsHeader extends StatelessWidget {
  final dynamic points; // Replace with your Points entity type

  const PointsHeader({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple.shade400, Colors.purple.shade600],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPointsIcon(),
          const SizedBox(height: 16),
          _buildPointsValue(),
          const SizedBox(height: 8),
          _buildPointsLabel(),
        ],
      ),
    );
  }

  Widget _buildPointsIcon() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.stars_rounded, size: 32, color: Colors.white),
    );
  }

  Widget _buildPointsValue() {
    return Text(
      '${points.total}',
      style: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: -1,
        height: 1,
      ),
    );
  }

  Widget _buildPointsLabel() {
    return Text(
      'Total Points',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.9),
        letterSpacing: 0.5,
      ),
    );
  }
}
