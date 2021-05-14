# jwt_decode

A easy dart package to decode JSON Web Tokens, and to check and give its expiry dates.



  ## Setup

  ### 1. Clone App
  
 
     $ git clone https://github.com/sidsbrmnn/jwt_decode.git
 
    
 ### 2. Move in Directory
  
     $ cd jwt_decode
  
  
   ### 4. Run Locally 
   ```
   $ dart jwt_decode.dart
  ```
  
 

## Using

### Decode a token

The easiest way to use this library is via the top-level function `parseJwt()`.

```dart
import 'package:jwt_decode/jwt_decode.dart';

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgRGVjb2RlIiwiaWF0IjoxNjA4NTgxNzczLCJleHAiOjE2NDAxMTc3NzMsImF1ZCI6Ind3dy5qd3RkZWNvZGUuY29tIiwic3ViIjoiQSBzYW1wbGUgSldUIiwibmFtZSI6IlZhcnVuIFMgQXRocmV5YSIsImVtYWlsIjoidmFydW4uc2F0aHJleWFAZ21haWwuY29tIiwicm9sZSI6IkRldmVsb3BlciJ9.vXE9ogUeMMsOTz2XQYHxE2hihVKyyxrhi_qfhJXamPQ';

Map<String, dynamic> payload = Jwt.parseJwt(token);

print(payload);

// After decoding, payload would look like this:
//  payload = {
//    'iss': 'JWT Decode',
//    'iat': 1608581773,
//    'exp': 1640117773,
//    'aud': 'www.jwtdecode.com',
//    'sub': 'A sample JWT',
//    'name': 'Varun S Athreya',
//    'email': 'varun.sathreya@gmail.com',
//    'role': 'Developer'
//  }
```

### Getting expiry date

To get the expiry date of the given token pass the token in the function `getExpiryDate()`.
`Note: The return value from this function is nullable`.

```dart
import 'package:jwt_decode/jwt_decode.dart';

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgRGVjb2RlIiwiaWF0IjoxNjA4NTgxNzczLCJleHAiOjE2NDAxMTc3NzMsImF1ZCI6Ind3dy5qd3RkZWNvZGUuY29tIiwic3ViIjoiQSBzYW1wbGUgSldUIiwibmFtZSI6IlZhcnVuIFMgQXRocmV5YSIsImVtYWlsIjoidmFydW4uc2F0aHJleWFAZ21haWwuY29tIiwicm9sZSI6IkRldmVsb3BlciJ9.vXE9ogUeMMsOTz2XQYHxE2hihVKyyxrhi_qfhJXamPQ';

DateTime? expiryDate = Jwt.getExpiryDate(token);

print(expiryDate);

// The expiry date would look like:
// expiryDate = 2021-12-22 01:46:13.000
```

### Checking weather the token has expired or not

To check weather the token has expired or not pass the token in the function `isExpired()`.



  
  
## Want to Contribute?

To start contributing, follow the below guidelines: 

**1.**  Fork [this](https://github.com/sidsbrmnn/jwt_decode.git) repository.

**2.**  Clone your forked copy of the project.

     $ git clone https://github.com/<your_user_name>/jwt_decode.git

     
**3.** Checkout into a new branch 

     $ git checkout -b <branch_name>

**4.** Make your changes

**5.** Add and commit your changes

     $ git add . && git commit -m "<your_message>"
     
**6.** Push Code to Github under your branch 

     $ git push origin <branch_name>   

