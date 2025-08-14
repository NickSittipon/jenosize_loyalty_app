import 'package:equatable/equatable.dart';

abstract class MembershipEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMembership extends MembershipEvent {}

class JoinMembershipEvent extends MembershipEvent {}
