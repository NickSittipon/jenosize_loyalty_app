import '../entities/referral.dart';
import '../repositories/referral_repository.dart';

class GenerateReferral {
  final ReferralRepository repository;

  GenerateReferral(this.repository);

  Future<Referral> call() async {
    return await repository.generateReferral();
  }
}
