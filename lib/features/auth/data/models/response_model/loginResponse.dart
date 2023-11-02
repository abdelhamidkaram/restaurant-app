import 'package:equatable/equatable.dart';
import 'package:food/features/auth/data/models/response_model/UserModel.dart';

class LoginResponse extends Equatable {
  int? status;
  String? message;
  UserModel? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }


  @override
  List<Object?> get props => throw UnimplementedError();

}
