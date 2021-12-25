import 'package:flutter/material.dart';
import 'package:training_app/colors.dart' as color;

class VideosInfo extends StatefulWidget {
  const VideosInfo({Key? key}) : super(key: key);

  @override
  _VideosInfoState createState() => _VideosInfoState();
}

class _VideosInfoState extends State<VideosInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
      body: Column(
        children: [const Text('data')],
      ),
    );
  }
}
