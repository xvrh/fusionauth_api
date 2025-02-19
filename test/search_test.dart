import 'package:fusionauth_api/fusionauth_api.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  late Client httpClient;
  late FusionauthClient api;

  setUp(() {
    httpClient = Client();
    api = FusionauthClient(httpClient, server, apiKey: apiKey);
  });

  tearDown(() {
    httpClient.close();
  });

  test('List users', () async {
    var ids = <String>[];
    for (var i = 0; i < 10; i++) {
      var email = randomEmail();
      var user = await api.createUser(
        body: UserRequest(
          skipVerification: true,
          sendSetPasswordEmail: false,
          user: User(email: email, password: 'Bonjour99'),
        ),
      );
      ids.add(user.user!.id!);
    }

    var response = await api.searchUsersByIdsWithId(ids);

    expect(response.users, hasLength(10));
    expect(response.total, 10);
  });
}
