import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../global/global.dart';
import '../environment.dart';

class HttpService {
  static HttpService shared = HttpService();

  static const Duration _timeout = Duration(seconds: 20);

  /// Decodes the JSON body regardless of HTTP status code, since the backend
  /// returns a {success, message, data} shape for both success and error
  /// responses. Throws on a non-JSON body (e.g. a proxy/HTML error page) so
  /// callers get a clear, catchable error instead of silently getting null
  /// or the exception object mistaken for data.
  dynamic checkStatusCode(response) {
    try {
      return jsonDecode(response.body);
    } catch (_) {
      throw Exception('Invalid server response (status ${response.statusCode})');
    }
  }

  Map<String, String> headers() {
    return <String, String>{
      'Authorization': 'Bearer $globalToken',
      'Content-Type': 'application/json; charset=UTF-8',
      "Content-Language": globalEng,
      "deviceToken": devicetoken,
      'OSType': osType,
      "AppVersionCode": appVersionCode,
    };
  }

  Uri uri(url) {
    final Uri uri = Uri.parse("$baseUrl$url");
    return uri;
  }

  Future get(String url) async {
    final Response response =
        await http.get(uri(url), headers: headers()).timeout(_timeout);
    return checkStatusCode(response);
  }

  Future post(String url, [body]) async {
    final Response response = await http
        .post(uri(url), headers: headers(), body: body)
        .timeout(_timeout);
    return checkStatusCode(response);
  }

  Future delete(String url, [body]) async {
    final Response response = await http
        .delete(uri(url), headers: headers(), body: body)
        .timeout(_timeout);
    return checkStatusCode(response);
  }

  Future patch(String url, [body]) async {
    final Response response = await http
        .patch(uri(url), headers: headers(), body: body)
        .timeout(_timeout);
    return checkStatusCode(response);
  }

  Future put(String url, [body]) async {
    final Response response = await http
        .put(uri(url), headers: headers(), body: body)
        .timeout(_timeout);
    return checkStatusCode(response);
  }
}
