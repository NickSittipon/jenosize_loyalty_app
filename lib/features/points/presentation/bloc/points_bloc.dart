import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize_test/features/points/domain/usecases/get_points.dart';
import 'points_event.dart';
import 'points_state.dart';

class PointsBloc extends Bloc<PointsEvent, PointsState> {
  final GetPoints getPoints;

  PointsBloc({required this.getPoints}) : super(PointsLoading()) {
    on<LoadPoints>((event, emit) async {
      emit(PointsLoading());
      try {
        final result = await getPoints.execute();
        emit(
          PointsLoaded(
            points: result['totalPoints'],
            transactions: result['transactions'],
          ),
        );
      } catch (e) {
        emit(PointsError(e.toString()));
      }
    });
  }
}
