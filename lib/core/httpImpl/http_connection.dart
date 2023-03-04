import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../constants/error_constants.dart';
import '../error/exceptions.dart';

class HttpConnect {
  static Future<dynamic> get({required String path}) async {
    http.Client client = http.Client();
    try {
      final response =
          await client.get(Uri.parse(ApiConstants.baseUrl + path), headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      });
      switch (response.statusCode) {
        case 200:
          final results = (json.decode(response.body));
          return results;
        case 400:
          throw ServerException(ErrorType.badRequest);
        case 401:
          throw ServerException(ErrorType.unAuthorized);
        case 500:
          throw ServerException(ErrorType.internalServerError);
        default:
          throw ServerException(ErrorType.unknownError);
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw e.toString();
    }
  }
}
