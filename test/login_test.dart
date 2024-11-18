import 'package:fusionauth_api/fusionauth_api.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  late Client httpClient;
  late FusionauthClient api;

  setUp(() {
    httpClient = Client();
    api = FusionauthClient(
      httpClient,
      server,
      apiKey: apiKey,
    );
  });

  tearDown(() {
    httpClient.close();
  });

  test('List tenants', () async {
    var tenants = await api.searchTenantsWithId(
      body: TenantSearchRequest(
        search: TenantSearchCriteria(),
      ),
    );
    expect(tenants.tenants, hasLength(1));
    expect(tenants.tenants![0].id, '00000000-0000-0000-0000-000000000001');
  });

  test('Create user', () async {
    var email = randomEmail();
    var user = await api.createUser(
      body: UserRequest(
        skipVerification: true,
        sendSetPasswordEmail: false,
        user: User(email: email, password: 'Bonjour99'),
      ),
    );

    expect(user.user!.email, email);
  });

  test('List users', () async {
    for (var i = 0; i < 10; i++) {
      var email = randomEmail();
      await api.createUser(
        body: UserRequest(
          skipVerification: true,
          sendSetPasswordEmail: false,
          user: User(email: email, password: 'Bonjour99'),
        ),
      );
    }

    var response = await api.searchUsersByQueryWithId(
      body: SearchRequest(
        search: UserSearchCriteria(
          queryString: '',
          startRow: 2,
          numberOfResults: 3,
        ),
      ),
    );

    expect(response.users, hasLength(3));
    expect(response.total, greaterThan(10));
  });
}
