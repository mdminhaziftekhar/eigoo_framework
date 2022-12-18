import 'package:json_annotation/json_annotation.dart';

part 'diary.g.dart';


@JsonSerializable()
class Diary {
  Diary(this.id,this.title, this.des, this.favorite, this.image, this.date);
  String id;
  String title;
  String des;
  bool favorite;
  List<String> image;
  DateTime date;

  
  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryToJson(this);
}
