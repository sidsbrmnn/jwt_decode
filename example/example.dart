import 'package:jwt_decode/jwt_decode.dart';

main() {
  // Sample token
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgRGVjb2RlIiwiaWF0IjoxNjA4NTgxNzczLCJleHAiOjE2NDAxMTc3NzMsImF1ZCI6Ind3dy5qd3RkZWNvZGUuY29tIiwic3ViIjoiQSBzYW1wbGUgSldUIiwibmFtZSI6IlZhcnVuIFMgQXRocmV5YSIsImVtYWlsIjoidmFydW4uc2F0aHJleWFAZ21haWwuY29tIiwicm9sZSI6IkRldmVsb3BlciJ9.vXE9ogUeMMsOTz2XQYHxE2hihVKyyxrhi_qfhJXamPQ';

  // To decode the token
  Map<String, dynamic> payload = Jwt.parseJwt(token);
  // Print the payload
  print(payload);

  // Print one of its property(example: email):
  print(payload['email']);

//   To get expiry date
//   Note: The return value from getExpiryDate function is nullable.
  DateTime? expiryDate = Jwt.getExpiryDate(token);
//   Print the expiry date
  print(expiryDate);

  // To check if token is expired
  bool isExpired = Jwt.isExpired(token);
  print(isExpired);

  // Can be used for auth state
  if (!isExpired) {
    //   Token isn't expired
  } else {
    //   Token is expired
  }
}
