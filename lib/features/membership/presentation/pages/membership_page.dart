import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize_test/shared/widgets/app_scaffold.dart';
import '../bloc/membership_bloc.dart';
import '../bloc/membership_event.dart';
import '../bloc/membership_state.dart';
import '../widgets/membership_card.dart';
import '../widgets/welcome_widget.dart';
import '../../domain/usecases/join_membership.dart';
import '../../data/repositories/membership_repository_impl.dart';

class MembershipPage extends StatelessWidget {
  const MembershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Membership",
      currentIndex: 1,
      body: BlocProvider(
        create: (_) => MembershipBloc(
          joinMembership: JoinMembership(MembershipRepositoryImpl()),
        )..add(LoadMembership()),
        child: const _MembershipContent(),
      ),
    );
  }
}

class _MembershipContent extends StatelessWidget {
  const _MembershipContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MembershipBloc, MembershipState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _buildStateWidget(context, state),
        );
      },
    );
  }

  Widget _buildStateWidget(BuildContext context, MembershipState state) {
    switch (state.runtimeType) {
      case MembershipLoading:
        return const _LoadingWidget();
      case MembershipJoined:
        return const WelcomeWidget();
      case MembershipNotJoined:
        return MembershipCard(onJoinPressed: () => _onJoinMembership(context));
      default:
        return const SizedBox.shrink();
    }
  }

  void _onJoinMembership(BuildContext context) {
    context.read<MembershipBloc>().add(JoinMembershipEvent());
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Loading membership status...',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
