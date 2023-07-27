import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://mhammadben1999.pythonanywhere.com/api";
  final String? _token;

  ApiBaseHelper({String? token}) : _token = token;

  Map<String, String> get _headers {
    Map<String, String> headers = {};
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    return headers;
  }

  Future<dynamic> getWithoutToken(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: {},
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithToken(String url) async {
    dynamic responseJson;
    try {
      final headers = {..._headers};
      if (_token != null) {
        headers['Authorization'] = 'Bearer $_token';
      }

      final response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: headers,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: _headers,
        body: body,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, Map<String, dynamic> body) async {
    dynamic responseJson;
    try {
      final headers = {..._headers};
      if (_token != null) {
        headers['Authorization'] = 'Bearer $_token';
      }
      final response = await http.put(
        Uri.parse(_baseUrl + url),
        headers: _headers,
        body: body,
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(_baseUrl + url),
        headers: _headers,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 409:
        throw ConflictException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 503:
        throw ServiceUnavailableException(response.body.toString());
      case 504:
        throw GatewayTimeoutException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
