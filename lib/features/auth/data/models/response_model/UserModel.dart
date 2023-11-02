import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel{
  @JsonKey(name : "id")
  int? id;

  @JsonKey(name : "name")
  String? name;
  @JsonKey(name : "email")
  String? email;
  @JsonKey(name : "phone")
  String? phone;
  @JsonKey(name : "address")
  String? address;
  @JsonKey(name : "jwtToken")
  String? jwtToken;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.jwtToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    jwtToken = json['jwt_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['jwt_token'] = this.jwtToken;
    return data;
  }
}