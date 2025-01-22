import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

String maskSensitiveData(String data) {
  final bytes = utf8.encode(data);
  final base64String = base64Encode(bytes);
  final reversed = base64String.split('').reversed.join();
  return reversed.replaceAll('=', '');  // Remove padding
}

String unmaskSensitiveData(String maskedData) {
  // Restore padding before decoding
  final padded = maskedData.padRight((maskedData.length + 3) & ~3, '=');
  final reversed = padded.split('').reversed.join();
  try {
    final bytes = base64Decode(reversed);
    return utf8.decode(bytes);
  } catch (e) {
    print('Error decoding base64 data: $e');
    return '';
  }
}

// Hash password
String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

// Secure storage
final secureStorage = FlutterSecureStorage();

// Save sensitive data
Future<void> saveSecureData(String key, String value) async {
  await secureStorage.write(key: key, value: value);
}

// Retrieve sensitive data
Future<String?> getSecureData(String key) async {
  return await secureStorage.read(key: key);
}

