import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title1 = 'This is Post 1';
  String title2 = 'This is Post 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PostCard(title1),
            SizedBox(height: 30,),
            PostCard(title2)
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String title;
  PostCard(this.title);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/post', arguments: title);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(title),
        ),
      ),
    );
  }
}
