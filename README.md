# jwt_decode

A easy library to decode Jsonwebtokens with a single function call.

## Using

The easiest way to use this library is via the top-level function `parseJwt()`.

```dart
import 'package:jwt_decode/jwt_decode.dart';

String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
Map<String, dynamic> payload = Jwt.parseJwt(token);
print(payload);
```
