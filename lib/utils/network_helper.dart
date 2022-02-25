import 'package:http/http.dart' as http;
import 'package:task_app/resources/strings.dart';

class NetworkHelper {
  static Future<http.Response> post(
    String endPoint,
    Object body, {
    bool authCall = true,
    String baseUrl = "",
    bool isAcceptLanguage = true,
  }) =>
      _commonApiCall(
          type: RequestType.post,
          endPoint: endPoint,
          body: body,
          authCall: authCall,
          baseUrl: baseUrl,
          isAcceptLanguage: isAcceptLanguage);

  static Future<http.Response> put(String endPoint, String body,
          {bool authCall = true}) =>
      _commonApiCall(
          type: RequestType.put,
          endPoint: endPoint,
          body: body,
          authCall: authCall);

  static Future<http.Response> get(
    String endPoint, {
    bool authCall = true,
    String baseUrl = "",
    bool isAcceptLanguage = true,
  }) =>
      _commonApiCall(
          type: RequestType.get,
          endPoint: endPoint,
          authCall: authCall,
          baseUrl: baseUrl,
          isAcceptLanguage: isAcceptLanguage);

  static Future<http.Response> _commonApiCall({
    required RequestType type,
    required String endPoint,
    String baseUrl = "",
    Object? body,
    bool authCall = true,
    bool isAcceptLanguage = true,
  }) async {
    if (baseUrl.isEmpty) {
      baseUrl = Apis.baseUrl;
    }

    http.Response res;
    final url = Uri.parse(baseUrl + endPoint);

    Map<String, String> headers = {
      if (authCall) "Authorization": "Bearer ${Apis.token}",
      "Content-Type": "application/json",
    };

    switch (type) {
      case RequestType.get:
        final result = await http.get(url, headers: headers);
        res = result;
        break;
      case RequestType.post:
        final result = await http.post(
          url,
          headers: headers,
          body: body,
        );
        res = result;
        break;
      case RequestType.put:
        final result = await http.put(
          url,
          headers: headers,
          body: body,
        );
        res = result;
        break;
    }

    return res;
  }
}

enum RequestType {
  get,
  post,
  put,
}
