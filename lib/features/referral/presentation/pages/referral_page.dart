import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize_test/shared/widgets/app_scaffold.dart';
import '../../data/repositories/referral_repository_impl.dart';
import '../../domain/usecases/generate_referral_code.dart';
import '../bloc/referral_bloc.dart';
import '../bloc/referral_event.dart';
import '../bloc/referral_state.dart';
import '../widgets/referral_loading_widget.dart';
import '../widgets/referral_error_widget.dart';
import '../widgets/referral_content.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = ReferralRepositoryImpl();
    final useCase = GenerateReferral(repository);

    return AppScaffold(
      title: "Refer a Friend",
      currentIndex: 2,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade50, Colors.white],
          ),
        ),
        child: BlocProvider(
          create: (_) =>
              ReferralBloc(generateReferral: useCase)
                ..add(GenerateReferralEvent()),
          child: BlocBuilder<ReferralBloc, ReferralState>(
            builder: (context, state) {
              if (state is ReferralLoading) {
                return const ReferralLoadingWidget();
              } else if (state is ReferralLoaded) {
                return ReferralContent(referral: state.referral);
              } else if (state is ReferralError) {
                return ReferralErrorWidget(
                  message: state.message,
                  onRetry: () {
                    context.read<ReferralBloc>().add(GenerateReferralEvent());
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
