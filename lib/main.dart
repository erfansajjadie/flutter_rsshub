import 'package:flutter/material.dart';
import 'package:rss_hub/screens/posts_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Telegram Channel RSS',
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: PostsListScreen()
      ),
    );
  }
}
