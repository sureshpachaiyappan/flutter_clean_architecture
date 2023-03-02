import 'package:dartz/dartz.dart';
import 'package:fluttercleancode/core/usecases/usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/login.dart';
import '../repositories/login_repo.dart';

class LetsLogin implements UseCase<Login, int> {
  final LoginRepository loginRepo;

  LetsLogin(this.loginRepo);

  @override
  Future<Either<Failure, Login>> execute(
    int number,
  ) async {
    return await loginRepo.loginUser(number);
  }
}

