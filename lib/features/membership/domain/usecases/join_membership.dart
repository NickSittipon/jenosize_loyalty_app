import '../repositories/membership_repository.dart';

class JoinMembership {
  final MembershipRepository repository;

  JoinMembership(this.repository);

  Future<void> call() async {
    await repository.saveMembership(true);
  }

  Future<bool> checkJoined() async {
    return await repository.isJoined();
  }
}
