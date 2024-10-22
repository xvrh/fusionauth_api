import 'dart:convert';
import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'download.dart' show specFile;
import 'open_api/dart.dart' as dart;
import 'open_api/swagger_spec.dart';
import 'package:yaml/yaml.dart';

// ignore_for_file: avoid_dynamic_calls

void main() {
  var yamlSpec = loadYaml(specFile.readAsStringSync());
  var jsonSpec = jsonDecode(jsonEncode(yamlSpec, toEncodable: (e) {
    if (e is YamlMap) {
      return e.map((key, value) => MapEntry(key.toString(), value));
    }
    return e;
  })) as Map<String, dynamic>;

  fixApi(jsonSpec);

  final spec = Spec.fromJson(jsonSpec);

  for (var e in {
    true: 'lib/src/api_kickstart_generated.dart',
    false: 'lib/src/api_generated.dart'
  }.entries) {
    var apiGenerator = dart.Api('Fusionauth', spec, isKickstart: e.key);
    var code = apiGenerator.toCode();
    try {
      code = DartFormatter().format(code);
    } catch (e) {
      print('Code has syntax error');
    }

    File(e.value).writeAsStringSync(code);
  }
}

void fixApi(Map<String, dynamic> spec) {
  addUserSearchPagination(spec);
}

void addUserSearchPagination(Map<String, dynamic> spec) {
  var schema = spec['components']['schemas']['UserSearchCriteria'];
  var properties = schema['properties'] as Map<String, dynamic>;
  properties['startRow'] = {'type': 'integer'};
  properties['numberOfResults'] = {'type': 'integer'};
}
