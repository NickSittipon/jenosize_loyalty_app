import '../entities/campaign.dart';

abstract class CampaignRepository {
  Future<List<Campaign>> getCampaigns();
}
