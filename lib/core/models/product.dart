import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;

  final String? title;

  final String? description;

  final double? price;

  final String? img;


  const Product(
      {required this.img,required this.id, required this.title, required this.description, required this.price});

  fomJson(Map<String, dynamic> json) {
    return Product(
        img: json['img'],
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price']);
  }



  @override
  List<Object?> get props => [id, title, description];

}