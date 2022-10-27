import 'package:comment_section/models/comment.dart';
import 'package:comment_section/models/post.dart';
import 'package:comment_section/services/comments_api.dart';
import 'package:comment_section/services/posts_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsNotifier extends StateNotifier<AsyncValue<List<Comment>>> {
  CommentsNotifier() : super(const AsyncValue.loading());

  CommentsNotifier.create(List<Comment> state) : super(AsyncValue.data(state));
  Future<List<Comment>> fetchComments(
      int postIndex, List<Comment> allComments) async {
    List<Comment> newComments = []; // new comments to be added to the current displayed list
    while (newComments.length < 20) { 
      newComments += await getComments(postIndex);
      postIndex++; // countiue to next post
    }
    allComments += newComments; 
    return allComments; 
  }

  Future<Post> fetchPost(int postId) async {
    return await PostsApi().fetchPost(postId);
  }

  Future<List<Comment>> getComments(int postId) async {
    return await CommentsApi().fetchComments(postId);
  }

  Future<void> addComment(Comment comment) async {
    await CommentsApi().addComment(comment);
  }
}

final commentsProvider = FutureProvider<List<Comment>>((ref) async {
  if (ref.read(refreshesProvider).state == 0) { // inital list(when no refreshes were made)
    List<Comment> comments = await CommentsNotifier().fetchComments(
      ref.read(indexProvider).state,
      [],
    );
    ref.read(currentCommentsProvider).state = comments;// updating the prov
    return comments;
  } else {
    List<Comment> comments = await CommentsNotifier().fetchComments(
      ref.read(indexProvider).state,
      ref.read(currentCommentsProvider).state as List<Comment>,
    );
    ref.read(currentCommentsProvider).state += comments;
    return comments;
  }
});
final currentCommentsProvider = StateProvider((ref) => []);

final refreshesProvider = StateProvider((ref) => 0); 
final indexProvider = StateProvider((ref) => 1);
