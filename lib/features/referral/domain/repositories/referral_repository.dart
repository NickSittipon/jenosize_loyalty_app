import '../entities/referral.dart';

abstract class ReferralRepository {
  Future<Referral> generateReferral();
}
