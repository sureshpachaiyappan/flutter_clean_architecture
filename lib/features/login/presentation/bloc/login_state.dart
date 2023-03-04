part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoggingIn extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoggedInWithSuccess extends LoginState {
  final String message;

  LoggedInWithSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class LoggedInWithError extends LoginState {
  final String message;

  LoggedInWithError({required this.message});
  @override
  List<Object?> get props => [message];
}
