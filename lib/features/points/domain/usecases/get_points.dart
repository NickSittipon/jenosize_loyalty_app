import '../repositories/points_repository.dart';

class GetPoints {
  final PointsRepository repository;

  GetPoints(this.repository);

  Future<Map<String, dynamic>> execute() async {
    final totalPoints = await repository.getTotalPoints();
    final transactions = await repository.getTransactions();
    return {'totalPoints': totalPoints, 'transactions': transactions};
  }
}
