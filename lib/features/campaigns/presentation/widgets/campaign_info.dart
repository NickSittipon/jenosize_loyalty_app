import 'package:flutter/material.dart';
import '../../domain/entities/campaign.dart';

class CampaignInfo extends StatelessWidget {
  final Campaign campaign;

  const CampaignInfo({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(height: 8),
        _buildDescription(context),
        const SizedBox(height: 16),
        _buildActionRow(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      campaign.title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: Colors.grey.shade900,
        letterSpacing: -0.2,
        height: 1.2,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      campaign.description,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.grey.shade600,
        height: 1.5,
        fontSize: 13,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      children: [_buildJoinButton(), const Spacer(), _buildArrowIcon()],
    );
  }

  Widget _buildJoinButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_circle_outline, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            'Join',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        size: 12,
        color: Colors.grey.shade500,
      ),
    );
  }
}
