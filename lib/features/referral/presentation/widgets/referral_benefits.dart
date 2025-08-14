import 'package:flutter/material.dart';

class ReferralBenefits extends StatelessWidget {
  const ReferralBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildBenefitsList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.card_giftcard,
            color: Colors.orange.shade600,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Referral Benefits',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitsList() {
    final benefits = [
      _BenefitItem(
        icon: Icons.stars,
        title: 'Earn 100 Points',
        description: 'Get 100 points for each successful referral',
      ),
      _BenefitItem(
        icon: Icons.person_add,
        title: 'Friend Gets Bonus',
        description: 'Your friend receives 50 welcome points',
      ),
      _BenefitItem(
        icon: Icons.trending_up,
        title: 'Unlimited Referrals',
        description: 'No limit on how many friends you can refer',
      ),
    ];

    return Column(
      children: benefits.map((benefit) => _buildBenefitItem(benefit)).toList(),
    );
  }

  Widget _buildBenefitItem(_BenefitItem benefit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(benefit.icon, color: Colors.orange.shade600, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  benefit.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  benefit.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitItem {
  final IconData icon;
  final String title;
  final String description;

  _BenefitItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}
