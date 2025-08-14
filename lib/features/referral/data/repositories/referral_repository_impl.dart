import 'dart:math';

import 'package:jenosize_test/features/referral/domain/entities/referral.dart';
import 'package:jenosize_test/features/referral/domain/repositories/referral_repository.dart';

class ReferralRepositoryImpl implements ReferralRepository {
  @override
  Future<Referral> generateReferral() async {
    final randomCode =
        "JENO${Random().nextInt(9999).toString().padLeft(4, '0')}";
    await Future.delayed(const Duration(milliseconds: 300));
    return Referral(code: randomCode);
  }
}
