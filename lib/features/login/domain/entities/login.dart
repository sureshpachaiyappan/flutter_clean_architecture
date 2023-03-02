import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Login extends Equatable {
  final String? text;
  final int? number;

  const Login({
    @required this.text,
    @required this.number,
  });
  @override
  List<Object?> get props => [text, number];
}
