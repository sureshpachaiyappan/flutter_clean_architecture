import 'package:dartz/dartz.dart';
import 'package:fluttercleancode/features/login/domain/entities/login.dart';

import '../../../../core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> loginUser(int number);
}
