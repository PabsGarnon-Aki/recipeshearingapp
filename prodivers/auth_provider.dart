import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;

  AuthProvider() {
    // Initialize with current user if any
    _user = _authService.currentUser;
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _authService.login(email, password);
      if (user != null) {
        _user = user;
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('Login error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _authService.register(name, email, password);
      if (user != null) {
        _user = user;
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('Registration error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.logout();
      _user = null;
    } catch (e) {
      print('Logout error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> updateProfile({
    String? name,
    String? profileImageUrl,
  }) async {
    if (_user == null) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final updatedUser = await _authService.updateProfile(
        name: name,
        profileImageUrl: profileImageUrl,
      );
      if (updatedUser != null) {
        _user = updatedUser;
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('Profile update error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
