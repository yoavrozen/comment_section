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
        leading: Icon(Icons.chat),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Yoav's comment section",
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              "Pull-To-Refresh to load more comments",
              style: TextStyle(fontSize: 14,),
            ),
          ],
        ),
      ),
      body: Container(child: CommentsList()),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 119, 216),
        child: Icon(Icons.add),
        onPressed: () => context.go('/newcommentpage'),
      ),
    );
  }
}
