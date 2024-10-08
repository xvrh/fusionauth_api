import 'package:fusionauth_api/fusionauth_api.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  late Client httpClient;

  setUp(() {
    httpClient = Client();
  });

  tearDown(() {
    httpClient.close();
  });

  test('Login test', () async {
    var apiKey = '<your api key>';

    var api = FusionauthClient(
      httpClient,
      Uri.https('sandbox.fusionauth.io'),
      apiKey: apiKey,
    );

    try {
      await api.loginWithId(
          body: LoginRequest(
        loginId: 'test@test.com',
        password: 'AbCd€',
        applicationId: '00000000-0000-0000-0000-000000000000',
      ));
      fail('Should not be ok');
    } catch (_) {
      // ok
    }
  });
}
