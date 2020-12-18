import 'package:jwt_decode/jwt_decode.dart';

main() {
  // Sample token
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  // To decode the token
  Map<String, dynamic> payload = Jwt.parseJwt(token);
  // Print the payload
  print(payload);

  // Print one of its property(example: name):
  print(payload['name']);

  // Check if the token has an expiry time
  if (payload['exp'] != null) {
    // Token has a expiry time
    if (!Jwt.isExpired(token)) {
      // Can be used for auth state
    }
  } else {
    print('Given token dosen\'t expire');
  }
}
