import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorageHelper {
  LocalSecureStorageHelper._internal();
  static final LocalSecureStorageHelper _instance =
      LocalSecureStorageHelper._internal();
  factory LocalSecureStorageHelper() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'ACCESS_TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';

  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }


  Future<void> writeJson({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    await _storage.write(key: key, value: jsonEncode(value));
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<Map<String, dynamic>?> readJson(String key) async {
    final data = await _storage.read(key: key);
    if (data == null) return null;
    return jsonDecode(data);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<bool> contains(String key) async {
    final value = await _storage.read(key: key);
    return value != null;
  }

  
  Future<void> saveAccessToken(String token) async {
    await write(key: _accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await read(_accessTokenKey);
  }

  Future<void> deleteAccessToken() async {
    await delete(_accessTokenKey);
  }

  Future<bool> hasAccessToken() async {
    return await contains(_accessTokenKey);
  }


  Future<void> saveRefreshToken(String token) async {
    await write(key: _refreshTokenKey, value: token);
  }

  Future<String?> getRefreshToken() async {
    return await read(_refreshTokenKey);
  }

  Future<void> deleteRefreshToken() async {
    await delete(_refreshTokenKey);
  }

  Future<bool> hasRefreshToken() async {
    return await contains(_refreshTokenKey);
  }


  Future<void> saveTokens({required String access, required String refresh}) async {
    await saveAccessToken(access);
    await saveRefreshToken(refresh);
  }

  Future<void> deleteTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}
