import 'package:dartz/dartz.dart';
import 'package:fluttercleancode/features/login/data/datasources/login_remote_source.dart';
import 'package:fluttercleancode/features/login/domain/repositories/login_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/login.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  final ServerFailure serverFailure;

  LoginRepoImpl(this.serverFailure, this.remoteDataSource);
  @override
  Future<Either<Failure, Login>> loginUser(int number) async {
    return await _getTrivia(() {
      return remoteDataSource.loginRemote(number);
    });
  }

  Future<Either<Failure, Login>> _getTrivia(
    var data,
  ) async {
    try {
      final remoteTrivia = await data();

      return Right(remoteTrivia);
    } on ServerException {
      return Left(serverFailure);
    }
  }
}
