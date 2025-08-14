import '../../domain/entities/campaign.dart';

class CampaignModel extends Campaign {
  CampaignModel({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
  }) : super(
         id: id,
         title: title,
         description: description,
         imageUrl: imageUrl,
       );
}
