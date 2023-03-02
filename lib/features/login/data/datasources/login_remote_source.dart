import 'dart:convert';

import 'package:fluttercleancode/features/login/data/models/login_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';

abstract class LoginRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  @override
  Future<LoginModel> loginRemote(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  Future<LoginModel> _getTriviaFromUrl(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException;
    }
  }
}
