import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';


//go to terminal and type
//flutter pub run build_runner build
//to generate the User.g.dart file
//DON'T ever touch User.g.dart just use it
@JsonSerializable()
class User{
  int id;
  String name;
  List<User> friends;
  User(this.id,this.name,this.friends);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}