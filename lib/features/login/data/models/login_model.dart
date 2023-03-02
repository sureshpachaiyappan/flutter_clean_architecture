import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required String text,
    required int number,
  });

  @override
  List<Object?> get props => [text, number];

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      text: json['text'],
      number: json['number'],
    );
  }
}
