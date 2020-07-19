import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app_for_redentu/model/tidings.dart';
import 'package:flutter_app_for_redentu/page/tidings-page.dart';
import 'package:flutter_app_for_redentu/properties.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Tidings> news = List<Tidings>();

  @override
  void initState() {
    fetchNews().then((value) {
      setState(() {
        news.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: news.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: news.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                      child: _tidingsListTile(news.elementAt(index)));
                })
            : Center(child: CircularProgressIndicator()));
  }

  ListTile _tidingsListTile(Tidings tidings) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          tidings.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () => onTidingsTap(tidings),
    );
  }

  onTidingsTap(Tidings tidings) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TidingsPage(tidings),
        ));
  }

  Future<List<Tidings>> fetchNews() async {
    final response = await http.get(NEWS_URL);

    var news = List<Tidings>();

    if (response.statusCode == 200) {
      var newsJson = json.decode(response.body);
      for (var tidingsJson in newsJson['articles']) {
        news.add(Tidings.fromJson(tidingsJson));
      }
    }
    return news;
  }

  List<Tidings> parseNews(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    final news = parsed.toString();
    print(news);
    return parsed.map<Tidings>((json) => Tidings.fromJson(json)).toList();
  }
}
