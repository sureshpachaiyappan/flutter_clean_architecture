import 'package:dartz/dartz.dart';
import 'package:fluttercleancode/features/login/domain/params/login_params.dart';
import 'package:fluttercleancode/features/login/domain/repositories/login_repository.dart';

import '../../../../core/error/failure.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser({required this.repository});

  Future<Either<Failure, String>> execute(
      {required LoginParams parameters}) async {
    return repository.loginUser(parameters: parameters);
  }
}
