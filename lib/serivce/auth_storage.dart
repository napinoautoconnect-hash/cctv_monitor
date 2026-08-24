import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const String _loggedInKey = 'is_logged_in';
  static const String _usernameKey = 'logged_in_username';

  // 3 users ke credentials
  static const Map<String, String> users = {
    'admin': 'admin123',
    'user1': 'user123',
    'user2': 'user123',
  };

  /// Login check
  static bool validateLogin(String username, String password) {
    return users[username] == password;
  }

  /// Login successful hone par session save
  static Future<void> saveLogin(String username) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_loggedInKey, true);
    await prefs.setString(_usernameKey, username);
  }

  /// Check user already logged in hai ya nahi
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  /// Currently logged-in username
  static Future<String?> getLoggedInUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  /// Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_loggedInKey);
    await prefs.remove(_usernameKey);
  }
}
