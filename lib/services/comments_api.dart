import 'package:comment_section/models/comment.dart';
import 'package:dio/dio.dart';

class CommentsApi {
  Future<List<Comment>> fetchComments(int postId) async {
    final response = await Dio()
        .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');
    List<dynamic> data = response.data;
    List<Comment> list = [];
    list = data.map((item) => Comment.fromJson(item)).toList();

    return list;
  }

  Future<void> addComment(Comment comment) async {
    Map map = comment.toMap();
    //final response = await Dio().post('https://cambium.co.il/test/testAssignComment', data: map);
    return Future.delayed(
        Duration(seconds: 2)); // mocking a response from the server
  }
}
