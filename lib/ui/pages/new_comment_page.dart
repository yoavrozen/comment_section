import 'package:comment_section/ui/widgets/new_comment_form.dart';
import 'package:flutter/material.dart';


class NewCommentPage extends StatefulWidget {
  @override
  _NewCommentPageState createState() => _NewCommentPageState();
}

class _NewCommentPageState extends State<NewCommentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create a new comment"),
        ),
        body: NewCommentForm());
  }
}
