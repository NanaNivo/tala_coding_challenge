import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({ required this.id,  required this.title,  required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];
}


// class Product extends Equatable{
//   final int id;
//   final String name;
//   final String description;
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//   }
// }