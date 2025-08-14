import 'package:equatable/equatable.dart';

abstract class ReferralEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenerateReferralEvent extends ReferralEvent {}
