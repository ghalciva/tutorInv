import 'dart:convert';

class Category{
  String id;
  String subject;
  String description;
  String image;

  Category({this.id, this.subject, this.description, this.image});
  
  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["_id"] as String,
      subject: json["subject"] as String,
      description: json["description"] as String,
      image: json["image"] as String,
    );
  }
}