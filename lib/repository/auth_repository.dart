import 'package:firebase_auth/firebase_auth.dart';
import 'package:identity/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<User?> register(String email, String password) {
    return _authService.registerWithEmail(email, password);
  }

  // Future<User?> login(String email, String password) {
  //   return _authService.loginUser(email, password);
  // }

  // Future<void> logout() {
  //   return _authService.logoutUser();
  // }
}