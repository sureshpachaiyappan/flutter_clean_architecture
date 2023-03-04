import 'package:dartz/dartz.dart';
import 'package:fluttercleancode/features/login/domain/params/login_params.dart';

import '../../../../core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> loginUser({required LoginParams parameters});
}
