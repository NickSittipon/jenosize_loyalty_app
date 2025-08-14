import 'package:flutter/material.dart';
import 'package:jenosize_test/features/campaigns/presentation/pages/campaigns_page.dart';
import 'package:jenosize_test/features/membership/presentation/pages/membership_page.dart';
import 'package:jenosize_test/features/points/presentation/pages/points_page.dart';
import 'package:jenosize_test/features/referral/presentation/pages/referral_page.dart';
import 'app/routes/app_router.dart';
import 'features/splash/presentation/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        AppRoutes.splash: (_) => const SplashPage(),
        AppRoutes.campaigns: (_) => const CampaignsPage(),
        AppRoutes.membership: (_) => const MembershipPage(),
        AppRoutes.refer: (_) => const ReferPage(),
        AppRoutes.points: (_) => const PointsPage(),
      },
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
