import 'package:flutter/material.dart';

class PointsErrorWidget extends StatelessWidget {
  final String message;

  const PointsErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildErrorIcon(),
            const SizedBox(height: 20),
            _buildErrorTitle(),
            const SizedBox(height: 12),
            _buildErrorMessage(),
            const SizedBox(height: 24),
            _buildRetryButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.error_outline, size: 48, color: Colors.red.shade400),
    );
  }

  Widget _buildErrorTitle() {
    return Text(
      'Oops! Something went wrong',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.grey.shade800,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildErrorMessage() {
    return Text(
      message,
      style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildRetryButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Add retry logic here - you might need to access the bloc
        // context.read<PointsBloc>().add(LoadPoints());
      },
      icon: const Icon(Icons.refresh),
      label: const Text('Try Again'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
    );
  }
}
