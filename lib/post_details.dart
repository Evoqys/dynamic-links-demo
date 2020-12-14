import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
