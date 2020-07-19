import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class QRGeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QRGeneratePageState();
}

class QRGeneratePageState extends State<QRGeneratePage> {
  GlobalKey globalKey = new GlobalKey();
  String _dataString;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Container(
              height: 48.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Enter a message",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: FlatButton(
                      child: Text("Generate"),
                      onPressed: () {
                        setState(() {
                          _dataString = _textController.text;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: _dataString != null
                ? Center(
                    child: RepaintBoundary(
                      key: globalKey,
                      child: QrImage(
                        data: _dataString,
                        size: 0.5 * bodyHeight,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
