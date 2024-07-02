import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:rss_hub/models/channel.dart';
import 'package:rss_hub/models/post.dart';
import 'package:http/http.dart' as http;

class PostsListScreen extends StatefulWidget {
  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {

  List<Post> _items = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    const url = 'https://rsshub.app/telegram/channel/persian_flutter?format=json';
    try {
      final response = await http.get(Uri.parse(url));
      Channel channel = Channel.fromJson(jsonDecode(response.body));
      setState(() {
        _items = channel.items;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSS Feed'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage))
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            child: ListTile(
              title: HtmlWidget(
                item.contentHtml,
                customWidgetBuilder: (element) {
                  if((element.localName ?? "") == "img") {
                    return Container();
                  }
                  return null;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
