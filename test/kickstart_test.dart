import 'dart:convert';

import 'package:fusionauth_api/kickstart.dart';
import 'package:test/test.dart';
import 'utils.dart';

void main() {
  test('Create user', () async {
    var kickstart = FusionauthKickstart();
    var email = 'user@email.com';
    kickstart.createUser(
      body: UserRequest(
        skipVerification: true,
        sendSetPasswordEmail: false,
        user: User(email: email, password: 'Bonjour99'),
      ),
    );

    var requests = kickstart.requests;
    expect(requests, [
      {
        'method': 'POST',
        'url': '/api/user',
        'body': {
          'sendSetPasswordEmail': false,
          'skipVerification': true,
          'user': {
            'email': 'user@email.com',
            'password': 'Bonjour99',
          }
        }
      }
    ]);
  });
}
