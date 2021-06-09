library jwt_decode;

import 'dart:convert';

class Jwt {
  /// Decode the JWT token in string format into a `Map<String, dynamic>` fomrat
  /// This map contains the decoded JSON payload.
  ///
  /// Throws [FormatException] if the `token` or the `payload` is invalid.
  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.'); // Splits the string by `.`
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

  static String _decodeBase64(String str) {
    String output = str
        .replaceAll('-', '+')
        .replaceAll('_', '/'); // Replaces all `-` with `_` and `+` with `/`

    /// Decoding logic

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

  /// Identifies weather the token as expired or not
  ///
  /// Returns boolean value, true if expired and false if not expired.
  ///
  /// Throws [FormatException] if the `token` or the `payload` is invalid.
  static bool isExpired(String token) {
    final DateTime? expirationDate = getExpiryDate(token);
    if (expirationDate != null) {
      return DateTime.now().isAfter(expirationDate);
    } else {
      return false;
    }
  }

  /// Returns the expiry date of the token
  ///
  /// returns null if there isn't any expiry date
  ///
  /// Throws [FormatException] if the `token` or the `payload` is invalid.
  static DateTime? getExpiryDate(String token) {
    final Map<String, dynamic> payload = parseJwt(token);
    if (payload['exp'] != null) {
      return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true)
          .add(Duration(seconds: payload["exp"]));
    }
    return null;
  }
}
