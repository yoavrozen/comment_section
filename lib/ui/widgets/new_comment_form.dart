import 'package:comment_section/models/comment.dart';
import 'package:comment_section/providers/comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewCommentForm extends StatefulWidget {
  @override
  _NewCommentFormState createState() => _NewCommentFormState();
}

class _NewCommentFormState extends State<NewCommentForm> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerBody;

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerEmail = TextEditingController();
    _controllerBody = TextEditingController();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerBody.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextField(
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                  labelText: 'Enter your email', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextField(
              controller: _controllerBody,
              decoration: InputDecoration(
                  labelText: 'Write your comment',
                  border: OutlineInputBorder()),
            ),
          ),
          Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  saveFunction(Comment(
                      postId: 101,
                      body: _controllerBody.text,
                      name: _controllerName.text,
                      email: _controllerEmail.text));
                  context.pop();
                },
                icon: Icon(Icons.save),
                label: Text('Add Comment')),
          )
        ],
      ),
    ));
  }

  Future<void> saveFunction(Comment comment) async {
    return await CommentsNotifier().addComment(comment);
  }
}
