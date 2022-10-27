import 'package:comment_section/models/post.dart';
import 'package:dio/dio.dart';

class PostsApi {
  Future<Post> fetchPost(int postId) async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts/$postId');
    final data = response.data;
    return Post.fromJson(data);
  }
}
