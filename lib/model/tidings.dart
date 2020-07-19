import 'package:flutter/foundation.dart';

class Tidings {
  final String author;
  final String title;
  final String description;
  final String content;
  final String url;

  Tidings(
      {@required this.author,
      @required this.title,
      @required this.description,
      @required this.content,
      @required this.url});

  Tidings.fromJson(Map<String, dynamic> map)
      : author = map['author'],
        title = map['title'],
        description = map['description'],
        content = map['content'],
        url = map['url'];
}
