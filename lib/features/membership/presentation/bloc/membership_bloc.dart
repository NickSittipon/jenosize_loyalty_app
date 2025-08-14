import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/join_membership.dart';
import 'membership_event.dart';
import 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final JoinMembership joinMembership;

  MembershipBloc({required this.joinMembership}) : super(MembershipInitial()) {
    on<LoadMembership>((event, emit) async {
      emit(MembershipLoading());
      final joined = await joinMembership.checkJoined();
      emit(joined ? MembershipJoined() : MembershipNotJoined());
    });

    on<JoinMembershipEvent>((event, emit) async {
      emit(MembershipLoading());
      await joinMembership.call();
      emit(MembershipJoined());
    });
  }
}
