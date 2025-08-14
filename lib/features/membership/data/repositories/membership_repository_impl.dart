import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repositories/membership_repository.dart';

class MembershipRepositoryImpl implements MembershipRepository {
  static const _keyJoined = 'membership_joined';

  @override
  Future<void> saveMembership(bool joined) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyJoined, joined);
  }

  @override
  Future<bool> isJoined() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyJoined) ?? false;
  }
}
