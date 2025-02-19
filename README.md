# A client for the Fusionauth REST APIs in Dart

The client is generated from the [OpenAPI specification](https://github.com/FusionAuth/fusionauth-openapi) provided by Fusionauth.

See [Fusionauth documentation of the APIs](https://fusionauth.io/docs/apis/)

## Usage

### Login

```dart
import 'dart:convert';
import 'package:fusionauth_api/fusionauth_api.dart';
import 'package:http/http.dart';

void main() async {
  var apiKey = '<your api key>';

  var httpClient = Client();
  var api = FusionauthClient(
    httpClient,
    Uri.https('sandbox.fusionauth.io'),
    apiKey: apiKey,
  );

  var result = await api.loginWithId(
    body: LoginRequest(
      loginId: 'test@test.com',
      password: 'AbCd€',
      applicationId: 'a-b-c-d-e',
    ),
  );
  print(jsonEncode(result));

  httpClient.close();
}
```

