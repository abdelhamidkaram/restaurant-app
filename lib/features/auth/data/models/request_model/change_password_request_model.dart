import 'package:equatable/equatable.dart';

class ChangePasswordRequestModel extends Equatable {
  final String phone;
  final String password;
  final String confirmPassword;

  const ChangePasswordRequestModel(
      {required this.phone,required this.password,
      required this.confirmPassword});


  toJson()=>{
    'phone':phone,
    'password':password,
    'confirm_password': confirmPassword
  };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
