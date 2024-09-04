import 'package:hive/hive.dart';
part 'saveModel.g.dart';

@HiveType(typeId: 6)
class SaveModel extends HiveObject {
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String urlToImage;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
  final String content;
  @HiveField(7)
  final String name;
  @HiveField(8)
  final DateTime dateTime;
  SaveModel(
      {required this.author,
      required this.content,
      required this.description,
      required this.name,
      required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.dateTime});
}
