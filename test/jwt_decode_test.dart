import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decode/jwt_decode.dart';

void main() {
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
  final invalidToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ';
  final payload = {'sub': '1234567890', 'name': 'John Doe', 'iat': 1516239022};

  test('decodes a jsonwebtoken', () {
    expect(Jwt.parseJwt(token), payload);
    expect(() => Jwt.parseJwt(invalidToken), throwsFormatException);
  });
}
