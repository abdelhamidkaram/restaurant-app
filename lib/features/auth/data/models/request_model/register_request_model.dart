import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String email;

  final String name;

  final String address;

  final String mobile;

  final String password;

  const RegisterRequestModel(
      {required this.email,
      required this.name,
      required this.address,
      required this.mobile,
      required this.password});


  toJson()=>{
    'email':email,
    'name':name,
    'mobile':mobile,
    'address':address,
    'password':password,
  };

  @override
  List<Object?> get props => [name, email, password, address];
}
