import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String email;

  final String name;

  final String address;

  final String phone;

  final String password;

  const RegisterRequestModel(
      {required this.name,
        required this.email,
      required this.address,
      required this.phone,
      required this.password});


  toJson()=>{
    'name':name,
    'email':email,
    'phone':phone,
    'password':password,
    'address':address,
    'firebase_token': 'firebase'
  };

  @override
  List<Object?> get props => [name, email, password, address];
}
