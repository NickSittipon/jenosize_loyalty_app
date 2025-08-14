import 'package:jenosize_test/features/points/domain/entities/transaction.dart';

import '../../domain/entities/points.dart';

abstract class PointsState {}

class PointsLoading extends PointsState {}

class PointsLoaded extends PointsState {
  final Points points;
  final List<PointTransaction> transactions;

  PointsLoaded({required this.points, required this.transactions});
}

class PointsError extends PointsState {
  final String message;

  PointsError(this.message);
}
