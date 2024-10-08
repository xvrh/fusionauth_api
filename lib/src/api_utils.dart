import 'dart:convert';
import 'package:http/http.dart';
import 'package:path/path.dart' as p;

export 'package:http/http.dart' show Client;
export 'package:http/http.dart' show MultipartFile;

class ApiClient {
  final Client _client;
  final Uri _baseUri;
  final String? authorization;

  ApiClient(this._baseUri, this._client, {required this.authorization});

  Future<T> send<T>(
    String method,
    String pathTemplate, {
    Map<String, String>? pathParameters,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    var path = pathTemplate;

    if (pathParameters != null) {
      for (var pathParameter in pathParameters.entries) {
        path = path.replaceAll(
            '{${pathParameter.key}}', Uri.encodeComponent(pathParameter.value));
      }
    }
    assert(!path.contains('{'));

    if (path.startsWith('/')) {
      path = path.substring(1);
    }

    var uri = _baseUri.replace(path: p.url.join(_baseUri.path, path));
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: {
        ...uri.queryParameters,
        ...queryParameters,
      });
    }

    BaseRequest request;
    var bodyRequest = Request(method, uri);
    request = bodyRequest;

    if (body != null) {
      bodyRequest
        ..headers['content-type'] = 'application/json'
        ..body = jsonEncode(body);
    }

    if (headers != null) {
      request.headers.addAll(headers);
    }

    if (authorization case var authorization?) {
      request.headers['Authorization'] = authorization;
    }

    var response = await Response.fromStream(await _client.send(request));
    ApiException.checkResponse(response);

    var decoded = _decode(response);
    return decoded as T;
  }

  dynamic _decode(Response response) {
    var bytes = response.bodyBytes;
    if (bytes.isEmpty) return null;

    var responseBody = utf8.decode(bytes);
    return jsonDecode(responseBody);
  }
}

class ApiException implements Exception {
  final Uri? url;
  final int statusCode;
  final String? reasonPhrase;
  final Map<String, dynamic>? fieldErrors;
  final List<dynamic>? generalErrors;

  ApiException(this.url, this.statusCode, this.reasonPhrase,
      {this.fieldErrors, this.generalErrors});

  factory ApiException.fromResponse(Response response) {
    Map<String, dynamic>? fieldErrors;
    List<dynamic>? generalErrors;
    if (response.body.isNotEmpty) {
      try {
        var decodedBody = jsonDecode(response.body);
        if (decodedBody is Map<String, dynamic>) {
          fieldErrors = decodedBody['fieldErrors'] as Map<String, dynamic>?;
          generalErrors = decodedBody['generalErrors'] as List<dynamic>?;
        } else {
          decodedBody = '$decodedBody';
        }
      } catch (e) {
        // Fail to parse as Json
      }
    }
    return ApiException(
        response.request?.url, response.statusCode, response.reasonPhrase,
        fieldErrors: fieldErrors, generalErrors: generalErrors);
  }

  @override
  String toString() => 'ApiException($statusCode, $reasonPhrase, url: $url, '
      'fieldErrors: $fieldErrors, generalErrors: $generalErrors)';

  static void checkResponse(Response response) {
    if (response.statusCode >= 200 && response.statusCode < 400) return;
    throw ApiException.fromResponse(response);
  }
}
