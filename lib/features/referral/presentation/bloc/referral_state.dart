import 'package:equatable/equatable.dart';
import '../../domain/entities/referral.dart';

abstract class ReferralState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReferralInitial extends ReferralState {}

class ReferralLoading extends ReferralState {}

class ReferralLoaded extends ReferralState {
  final Referral referral;

  ReferralLoaded({required this.referral});

  @override
  List<Object?> get props => [referral];
}

class ReferralError extends ReferralState {
  final String message;

  ReferralError({required this.message});

  @override
  List<Object?> get props => [message];
}
