import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  final String email;
  final String password;
  final int type = 1;//1 normal register, 2 facebook, 3 google, 4 desktop,5 site

  const LoginRequestModel(
      {required this.email,
      required this.password});


  toJson()=>{
    'key':email,
    'password':password,
    'type': type
  };

  @override
  List<Object?> get props => [ email, password , type];
}
