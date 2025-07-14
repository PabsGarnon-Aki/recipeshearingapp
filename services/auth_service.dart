import '../models/user_model.dart';

class AuthService {
  User? _currentUser;
  
  User? get currentUser => _currentUser;

  // Simulate login
  Future<User?> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock user data
    _currentUser = User(
      id: '1',
      name: 'John Doe',
      email: email,
      profileImageUrl: null,
    );
    
    return _currentUser;
  }

  // Simulate registration
  Future<User?> register(String name, String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock user data
    _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      profileImageUrl: null,
    );
    
    return _currentUser;
  }

  // Logout
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  // Check if user is logged in
  bool get isLoggedIn => _currentUser != null;

  // Update user profile
  Future<User?> updateProfile({
    String? name,
    String? profileImageUrl,
  }) async {
    if (_currentUser == null) return null;
    
    await Future.delayed(const Duration(seconds: 1));
    
    _currentUser = _currentUser!.copyWith(
      name: name,
      profileImageUrl: profileImageUrl,
    );
    
    return _currentUser;
  }
}
