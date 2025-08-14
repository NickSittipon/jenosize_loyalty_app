import 'package:flutter/material.dart';
import 'package:jenosize_test/app/routes/route_names.dart';
import 'package:jenosize_test/features/campaigns/presentation/pages/campaigns_page.dart';
import 'package:jenosize_test/features/membership/presentation/pages/membership_page.dart';
import 'package:jenosize_test/features/points/presentation/pages/points_page.dart';
import 'package:jenosize_test/features/referral/presentation/pages/referral_page.dart';
import 'package:jenosize_test/features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static const String campaigns = RoutesName.campaigns;
  static const String membership = RoutesName.membership;
  static const String refer = RoutesName.refer;
  static const String points = RoutesName.points;
  static const String splash = RoutesName.splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.campaigns:
        return MaterialPageRoute(builder: (_) => const CampaignsPage());
      case RoutesName.membership:
        return MaterialPageRoute(builder: (_) => const MembershipPage());
      case RoutesName.refer:
        return MaterialPageRoute(builder: (_) => const ReferPage());
      case RoutesName.points:
        return MaterialPageRoute(builder: (_) => const PointsPage());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
