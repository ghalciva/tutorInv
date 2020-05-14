import 'dart:convert';

class File{
  String id;
  String subject;
  String file;

  File({this.id, this.subject, this.file});
  
  factory File.fromJson(Map<String, dynamic> json){
    return File(
      id: json["_id"] as String,
      subject: json["subject"] as String,
      file: json["file"] as String,
    );
  }
}