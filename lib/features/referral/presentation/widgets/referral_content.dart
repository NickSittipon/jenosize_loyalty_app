import 'package:flutter/material.dart';
import 'referral_hero_card.dart';
import 'referral_code_card.dart';
import 'referral_actions.dart';
import 'referral_benefits.dart';

class ReferralContent extends StatelessWidget {
  final dynamic referral; // Replace with your Referral entity type

  const ReferralContent({super.key, required this.referral});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const ReferralHeroCard(),
          const SizedBox(height: 24),
          ReferralCodeCard(code: referral.code),
          const SizedBox(height: 20),
          ReferralActions(referralCode: referral.code),
          const SizedBox(height: 32),
          const ReferralBenefits(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
