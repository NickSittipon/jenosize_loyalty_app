import 'package:jenosize_test/features/points/domain/entities/transaction.dart';

import '../../domain/entities/points.dart';
import '../../domain/repositories/points_repository.dart';

class PointsRepositoryImpl implements PointsRepository {
  @override
  Future<Points> getTotalPoints() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Points(total: 250); // mock
  }

  @override
  Future<List<PointTransaction>> getTransactions() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      PointTransaction(
        description: "Joined campaign",
        points: 50,
        date: DateTime.now().subtract(const Duration(days: 2)),
      ),
      PointTransaction(
        description: "Referral",
        points: 100,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      PointTransaction(
        description: "Daily login",
        points: 100,
        date: DateTime.now(),
      ),
    ];
  }
}
