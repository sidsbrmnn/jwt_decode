library jwt_decode;

import 'dart:convert';

class Jwt {
  static Map<String, dynamic> parseJwt(String /*!*/ token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw FormatException('Invalid token.');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw FormatException('Invalid payload.');
    }

    return payloadMap;
  }

  static String _decodeBase64(String /*!*/ str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += "==";
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64 string.');
    }

    return utf8.decode(base64Url.decode(output));
  }

  static bool isExpired(String /*!*/ token) {
    try {
      final Map<String, dynamic> payload = parseJwt(token);
      if (payload != null) {
        final DateTime expirationDate = DateTime.fromMillisecondsSinceEpoch(0)
            .add(Duration(seconds: payload["exp"]));
        return DateTime.now().isAfter(expirationDate);
      } else {
        return true;
      }
    } catch (e) {
      throw Exception("Given token dosen't expire");
    }
  }
}
