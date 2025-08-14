import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_campaigns.dart';
import 'campaign_event.dart';
import 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final GetCampaigns getCampaigns;

  CampaignBloc({required this.getCampaigns}) : super(CampaignInitial()) {
    on<LoadCampaigns>((event, emit) async {
      emit(CampaignLoading());
      try {
        final campaigns = await getCampaigns();
        emit(CampaignLoaded(campaigns));
      } catch (e) {
        emit(CampaignError(e.toString()));
      }
    });
  }
}
