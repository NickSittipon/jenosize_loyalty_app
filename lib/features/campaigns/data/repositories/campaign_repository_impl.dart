import 'package:jenosize_test/features/campaigns/domain/repositories/campaign_repository.dart';

import '../../domain/entities/campaign.dart';
import '../datasources/mock_campaigns.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  @override
  Future<List<Campaign>> getCampaigns() async {
    await Future.delayed(const Duration(milliseconds: 300)); // simulate network
    return mockCampaigns;
  }
}
