import 'dart:io';

import 'package:http/http.dart';

final _specUrl = Uri.parse('https://raw.githubusercontent.com/FusionAuth/fusionauth-openapi/main/openapi.yaml');

final specFile = File('tool/fusionauth_open_api.yaml');

void main() async {
  var content = await read(_specUrl);
  await specFile.writeAsString(content);
}