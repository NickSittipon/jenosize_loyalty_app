abstract class MembershipRepository {
  Future<void> saveMembership(bool joined);
  Future<bool> isJoined();
}
