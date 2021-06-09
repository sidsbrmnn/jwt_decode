import 'package:jwt_decode/jwt_decode.dart';
import 'package:test/test.dart';

void main() {
  final String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgRGVjb2RlIiwiaWF0IjoxNjA4NTgxNzczLCJleHAiOjE2NDAxMTc3NzMsImF1ZCI6Ind3dy5qd3RkZWNvZGUuY29tIiwic3ViIjoiQSBzYW1wbGUgSldUIiwibmFtZSI6IlZhcnVuIFMgQXRocmV5YSIsImVtYWlsIjoidmFydW4uc2F0aHJleWFAZ21haWwuY29tIiwicm9sZSI6IkRldmVsb3BlciJ9.vXE9ogUeMMsOTz2XQYHxE2hihVKyyxrhi_qfhJXamPQ';
  final String invalidToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ';
  Map<String, dynamic> payload = {
    'iss': 'JWT Decode',
    'iat': 1608581773,
    'exp': 1640117773,
    'aud': 'www.jwtdecode.com',
    'sub': 'A sample JWT',
    'name': 'Varun S Athreya',
    'email': 'varun.sathreya@gmail.com',
    'role': 'Developer'
  };

  test('decodes a jsonwebtoken', () {
    expect(Jwt.parseJwt(token), payload);
    expect(() => Jwt.parseJwt(invalidToken), throwsFormatException);
  });

  test('getting expiry date', () {
    expect(
      Jwt.getExpiryDate(token),
      DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).add(
        Duration(seconds: payload['exp']),
      ),
    );
    expect(() => Jwt.getExpiryDate(invalidToken), throwsFormatException);
  });

  test('checking if token is expired', () {
    expect(Jwt.isExpired(token), false);
    expect(() => Jwt.isExpired(invalidToken), throwsFormatException);
  });
}
