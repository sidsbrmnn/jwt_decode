# jwt_decode

`jwt_decode` is a lightweight library for decoding JSON Web Tokens (JWTs) in Dart.

**IMPORTANT**: This library does not validate the tokens. It can decode any well-formed ones.

## Installation

Add `jwt_decode` to your project's pubspec.yaml file:

```yaml
dependencies:
  jwt_decode: ^0.3.1
```

Then run `flutter pub get` to install the package.

## Using

Here's an example of how to use `jwt_decode` to decode a JWT:

```dart
import 'package:jwt_decode/jwt_decode.dart';

void main() {
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjE1MTYyMzkwMjJ9.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
  final Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
  print(decodedToken);
}
```

This will output the following:

```json
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022,
  "exp": 1516239022
}
```

## API Reference

### `Jwt.parseJwt(String token)`

Parses the given JWT and returns a map containing the token's claims.

### `Jwt.getExpiryDate(String token)`

Parses the given JWT and returns the `DateTime` object containing the
token's expiry date if the token is valid and `null` if not.

### `Jwt.isExpired(String token)`

Parses the given JWT and returns `true` if the token is still valid,
and `false` otherwise.

## Contributing

Contributions are welcome! Please see our [Contributing Guidelines](CONTRIBUTING.md) for more information.

## License

`jwt_decode` is licensed under the [BSD 3-clause license](LICENSE).
