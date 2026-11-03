import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import '../../global/global.dart';
import '../../global/global.dart';
import '../environment.dart';




class HttpService {
  static HttpService shared = HttpService();  
  dynamic checkStatusCode(response) async {

    try { 
      if (response.statusCode == 200) {
        response = jsonDecode(response.body);
        return response;
      }
    } catch (err) {
      return err;
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
    final Response response = await http.get(uri(url), headers: headers());
    return checkStatusCode(response);
  }

  Future post(String url, [body]) async {
    final Response response =
        await http.post(uri(url), headers: headers(), body: body);
    return checkStatusCode(response);
  }

  Future delete(String url, [body]) async {
    final Response response =
        await http.delete(uri(url), headers: headers(), body: body);
    return checkStatusCode(response);
  }

    Future patch(String url, [body]) async {
    final Response response =
        await http.patch(uri(url), headers: headers(), body: body);
    return checkStatusCode(response);
  }

  Future put(String url, [body]) async {
    final Response response =
        await http.put(uri(url), headers: headers(), body: body);
    return checkStatusCode(response);
  }
}
