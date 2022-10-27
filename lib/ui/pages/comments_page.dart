import 'package:flutter/material.dart';
import 'package:comment_section/ui/widgets/comments_list.dart';
import 'package:go_router/go_router.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Yoav's comment section"),
      ),
      body: Container(child: CommentsList()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.go('/newcommentpage'),
      ),
    );
  }
}
