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
    var isKickstart = e.key;
    var apiGenerator = dart.Api('Fusionauth', spec,
        isKickstart: isKickstart,
        customImplementations: !isKickstart ? _customImplementations : null);
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
  _addUserSearchPagination(spec);
  _validateUserSearchByIds(spec);
}

void _addUserSearchPagination(Map<String, dynamic> spec) {
  var schema = spec['components']['schemas']['UserSearchCriteria'];
  var properties = schema['properties'] as Map<String, dynamic>;
  properties['startRow'] = {'type': 'integer'};
  properties['numberOfResults'] = {'type': 'integer'};
}

void _validateUserSearchByIds(Map<String, dynamic> spec) {
  var endpoint = spec['paths']['/api/user/search'] as Map<String, dynamic>;
  var method = 'get';
  var schema = endpoint[method];
  assert(schema['operationId'] == 'searchUsersByIdsWithId');
  var parameters =
      (schema['parameters'] as List<dynamic>).cast<Map<String, dynamic>>();
  var idsParameter = parameters.firstWhere((p) => p['name'] == 'ids');
  assert(idsParameter['in'] == 'query');
}

final _customImplementations = {
  'searchUsersByIdsWithId': _customApiSearchImplementation,
};

String _customApiSearchImplementation =
//language=dart
    '''
  Future<SearchResponse> searchUsersByIdsWithId(Iterable<String> ids) async {
    return SearchResponse.fromJson(await _client.send(
      'get',
      'api/user/search',
      queryParametersAll: {
        'ids': ids,
      },
    ));
  }
''';
