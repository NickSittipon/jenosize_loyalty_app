import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize_test/features/referral/domain/usecases/generate_referral_code.dart';
import 'referral_event.dart';
import 'referral_state.dart';

class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  final GenerateReferral generateReferral;

  ReferralBloc({required this.generateReferral}) : super(ReferralInitial()) {
    on<GenerateReferralEvent>((event, emit) async {
      emit(ReferralLoading());
      try {
        final referral = await generateReferral();
        emit(ReferralLoaded(referral: referral));
      } catch (e) {
        emit(ReferralError(message: e.toString()));
      }
    });
  }
}
