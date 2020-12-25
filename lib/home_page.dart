import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title1 = 'This is Post 1';
  String title2 = 'This is Post 2';

  @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }
  initDynamicLinks() async {
    // this is called when app comes from background
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            print(deepLink.queryParameters['title'].toString());
            Navigator.pushNamed(context, '/post', arguments: deepLink.queryParameters['title']);

          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );

    // this is called when app is not open in background

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, '/post', arguments: deepLink.queryParameters['title']);
    }
  }
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
