import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionManager {
  static const keyToken = "USER_TOKEN";
  static const refreshKeyToken = "REFRESH_USER_TOKEN";
  static const authorizeToken = "Authorization";

  Future<void> deleteToken();

  Future<void> deleteRefreshToken();

  Future<void> persistToken(String token);

  Future<void> persistRefreshToken(String token);

  Future<String> get authToken;

  Future<String> get refreshToken;

  Future<bool> get hasToken;
}

class SecureSessionManager extends SessionManager {
  static final SecureSessionManager _instance = SecureSessionManager._internal();
  final _storage = const FlutterSecureStorage();

  factory SecureSessionManager() {
    return _instance;
  }

  SecureSessionManager._internal();

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: SessionManager.keyToken);
    return;
  }

  @override
  Future<void> persistToken(String token) async {
    _storage.write(key: SessionManager.keyToken, value: token);
    return;
  }

  @override
  Future<void> persistRefreshToken(String token) async {
    _storage.write(key: SessionManager.refreshKeyToken, value: token);
    return;
  }

  @override
  Future<String> get authToken async {
    return await _storage.read(key: SessionManager.keyToken) ?? '';
  }

  @override
  Future<String> get refreshToken async {
    return await _storage.read(key: SessionManager.refreshKeyToken) ?? '';
  }

  @override
  Future<bool> get hasToken async {
    return await _storage.containsKey(key: SessionManager.keyToken);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: SessionManager.keyToken);
    return;
  }
}

class DefaultSessionManager extends SessionManager {
  static final DefaultSessionManager _instance = DefaultSessionManager._internal();

  factory DefaultSessionManager() {
    return _instance;
  }

  DefaultSessionManager._internal();

  Future<SharedPreferences> _initStorage() {
    return SharedPreferences.getInstance();
  }

  @override
  Future<String> get authToken async {
    final prefs = await _initStorage();

    return prefs.getString(SessionManager.keyToken) ?? '';
  }

  @override
  Future<void> deleteToken() async {
    final prefs = await _initStorage();
    prefs.remove(SessionManager.keyToken);
  }

  @override
  Future<bool> get hasToken async {
    final prefs = await _initStorage();
    return prefs.containsKey(SessionManager.keyToken);
  }

  @override
  Future<void> persistRefreshToken(String token) async {
    final prefs = await _initStorage();
    prefs.setString(SessionManager.refreshKeyToken, token);
  }

  @override
  Future<void> persistToken(String token) async {
    final prefs = await _initStorage();
    prefs.setString(SessionManager.keyToken, token);
  }

  @override
  Future<String> get refreshToken async {
    final prefs = await _initStorage();

    return prefs.getString(SessionManager.refreshKeyToken) ?? '';
  }

  @override
  Future<void> deleteRefreshToken() async {
    final prefs = await _initStorage();
    prefs.remove(SessionManager.refreshKeyToken);
  }
}
