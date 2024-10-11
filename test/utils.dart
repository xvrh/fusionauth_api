import 'dart:math';

int _email = 0;
String randomEmail() =>
    'email-${DateTime.now().millisecondsSinceEpoch ~/ 1000}-${++_email}-${Random().nextInt(99999999)}@email.com';
