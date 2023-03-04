import 'package:fluttercleancode/core/constants/api_constants.dart';
import 'package:fluttercleancode/core/constants/response_constants.dart';
import '../../../../core/httpImpl/http_connection.dart';
import '../../domain/params/login_params.dart';

abstract class LoginDataSource {
  Future<String> loginUser({required LoginParams parameters});
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<String> loginUser({required LoginParams parameters}) async {
    try {
      await HttpConnect.get(path: ApiConstants.loginUrl);
      return ResponseConst.loggedIn;
    } catch (e) {
      return e.toString();
    }
  }
}
