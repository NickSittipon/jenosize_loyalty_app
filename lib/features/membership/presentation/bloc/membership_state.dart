import 'package:equatable/equatable.dart';

abstract class MembershipState extends Equatable {
  @override
  List<Object> get props => [];
}

class MembershipInitial extends MembershipState {}

class MembershipLoading extends MembershipState {}

class MembershipJoined extends MembershipState {}

class MembershipNotJoined extends MembershipState {}
