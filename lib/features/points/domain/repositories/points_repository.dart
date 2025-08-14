import 'package:jenosize_test/features/points/domain/entities/transaction.dart';

import '../entities/points.dart';

abstract class PointsRepository {
  Future<Points> getTotalPoints();
  Future<List<PointTransaction>> getTransactions();
}
