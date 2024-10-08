import 'dart:convert';
import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'download.dart' show specFile;
import 'open_api/dart.dart' as dart;
import 'open_api/swagger_spec.dart';
import 'package:yaml/yaml.dart';

void main() {
  var yamlSpec = loadYaml(specFile.readAsStringSync());
  var jsonSpec = jsonDecode(jsonEncode(yamlSpec, toEncodable: (e) {
    if (e is YamlMap) {
      return e.map((key, value) => MapEntry(key.toString(), value));
    }
    return e;
  })) as Map<String, dynamic>;

  final spec = Spec.fromJson(jsonSpec);

  var apiGenerator = dart.Api('Fusionauth', spec);
  var code = apiGenerator.toCode();
  try {
    code = DartFormatter().format(code);
  } catch (e) {
    print('Code has syntax error');
  }

  File('lib/src/api_generated.dart').writeAsStringSync(code);
}
