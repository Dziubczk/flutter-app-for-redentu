import 'dart:io';
import 'dart:convert';
import 'package:flutter_app_for_redentu/properties.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  File file;
  String message = '';

  void _choose() async {
    file = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  void _upload() {
    if (file == null) return;
    String base64Image = base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;

    http.post(URL_FOR_PHOTO, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      setState(() {
        if (res.statusCode != 200) {
          message = "Error: ${res.statusCode}";
        } else {
          //message = res.body.split('"').reversed.skip(1).first;
          message = jsonDecode(res.body)['message'];
        }
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            FlatButton(
              child:
                  Text("Take Picture", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                _choose();
                _upload();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
