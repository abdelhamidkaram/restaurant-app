import 'package:equatable/equatable.dart';

class ForgetPasswordRequestModel extends Equatable {
  final String email;

  const ForgetPasswordRequestModel(
      {required this.email});


  toJson()=>{
    'email':email,
  };

  @override
  List<Object?> get props => [ email];
}
