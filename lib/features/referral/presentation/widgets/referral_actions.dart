import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class ReferralActions extends StatelessWidget {
  final String referralCode;

  const ReferralActions({super.key, required this.referralCode});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildShareButton(context)),
        const SizedBox(width: 12),
        Expanded(child: _buildCopyButton(context)),
      ],
    );
  }

  Widget _buildShareButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handleShare(),
      icon: const Icon(Icons.share_rounded),
      label: const Text('Share'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        shadowColor: Colors.orange.withOpacity(0.3),
      ),
    );
  }

  Widget _buildCopyButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handleCopy(context),
      icon: const Icon(Icons.copy_rounded),
      label: const Text('Copy'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.orange.shade200, width: 2),
        ),
        elevation: 0,
      ),
    );
  }

  void _handleShare() {
    Share.share(
      "🎉 Join me on Jenosize App and get amazing rewards! Use my referral code: $referralCode\n\nDownload now and start earning points together! 🚀",
      subject: "Join Jenosize App!",
    );
  }

  void _handleCopy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: referralCode));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            const Text('Referral code copied!'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
