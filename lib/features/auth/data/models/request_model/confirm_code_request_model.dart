import 'package:equatable/equatable.dart';

class ConfirmCodeRequestModel extends Equatable {
  final String email;
  final String code;

  const ConfirmCodeRequestModel(
      {required this.email,required this.code});


  toJson()=>{
    'email':email,
    'code':code,
  };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
