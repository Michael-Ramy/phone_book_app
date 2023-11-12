import 'package:uuid/uuid.dart';

class Contact {
  String? id;
  String name;
  String number;
  String? avatar;

  Contact({this.id, required this.name, required this.number, this.avatar}){
    id = const Uuid().v4();
  }

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json['id'],
    name: json['name'],
    number: json['number'],
    avatar: json['avatar']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'number': number,
    'avatar': avatar
  };

}