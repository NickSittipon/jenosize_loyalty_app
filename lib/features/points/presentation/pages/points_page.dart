import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize_test/features/points/presentation/widgets/points_error.dart';
import 'package:jenosize_test/features/points/presentation/widgets/points_loading.dart';
import 'package:jenosize_test/shared/widgets/app_scaffold.dart';
import '../../data/repositories/points_repository_impl.dart';
import '../../domain/usecases/get_points.dart';
import '../bloc/points_bloc.dart';
import '../bloc/points_event.dart';
import '../bloc/points_state.dart';
import '../widgets/points_header.dart';
import '../widgets/transaction_list.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PointsRepositoryImpl();
    final getPoints = GetPoints(repository);

    return AppScaffold(
      title: "My Points",
      currentIndex: 3,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade50, Colors.white],
          ),
        ),
        child: BlocProvider(
          create: (_) => PointsBloc(getPoints: getPoints)..add(LoadPoints()),
          child: BlocBuilder<PointsBloc, PointsState>(
            builder: (context, state) {
              if (state is PointsLoading) {
                return const PointsLoadingWidget();
              } else if (state is PointsLoaded) {
                return _buildLoadedContent(state);
              } else if (state is PointsError) {
                return PointsErrorWidget(message: state.message);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(PointsLoaded state) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add refresh logic here
      },
      child: Column(
        children: [
          PointsHeader(points: state.points),
          const SizedBox(height: 8),
          Expanded(child: TransactionList(transactions: state.transactions)),
        ],
      ),
    );
  }
}
