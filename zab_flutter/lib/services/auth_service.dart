import 'package:flutter/foundation.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String plan;

  User({required this.uid, required this.name, required this.email, this.plan = 'free'});
}

class AuthService extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  Future<void> signIn(String email, String password) async {
    // Mock network delay
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = User(uid: '123', name: 'Test User', email: email);
    notifyListeners();
  }

  Future<void> signUp(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUser = User(uid: '123', name: name, email: email);
    notifyListeners();
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}
