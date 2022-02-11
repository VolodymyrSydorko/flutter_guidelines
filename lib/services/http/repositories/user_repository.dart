import 'package:flutter_guidelines/screens/authentication/models/index.dart';
import 'package:injectable/injectable.dart';

import '../http_client.dart';

@injectable
class UserRepository {
  UserRepository({required this.httpClient});

  final HttpClient httpClient;

  Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password) {
    return Future.delayed(const Duration(seconds: 2), () {
      return AuthResponse(1, 'token');
    });
  }

  Future<UserProfile> getUser(int id) async {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserProfile(id, 'email');
    });
  }

  Future<bool> isSignedIn() async {
    return true;
  }
}
