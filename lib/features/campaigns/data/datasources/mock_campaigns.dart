import 'package:jenosize_test/features/campaigns/domain/entities/campaign.dart';

final List<Campaign> mockCampaigns = [
  Campaign(
    id: '1',
    title: 'Summer Sale',
    description: 'Get 50% off your favorite items!',
    imageUrl: 'assets/images/summer_sale.jpg',
  ),
  Campaign(
    id: '2',
    title: 'Buy 1 Get 1 Free',
    description: 'Special offer for loyalty members.',
    imageUrl: 'assets/images/buyone_freeone.jpg',
  ),
  Campaign(
    id: '3',
    title: 'Free Shipping',
    description: 'For orders above \$50.',
    imageUrl: 'assets/images/free_shipping.jpg',
  ),
  Campaign(
    id: '4',
    title: 'Big Sale',
    description: 'Up to 70% off on selected items!',
    imageUrl: 'assets/images/big_sale.jpg',
  ),
  Campaign(
    id: '5',
    title: 'Referral Bonus',
    description: 'Invite friends and earn points!',
    imageUrl: 'assets/images/refferal_freind.jpg',
  ),
];
