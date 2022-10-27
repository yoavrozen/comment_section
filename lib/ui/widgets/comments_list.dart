import 'package:comment_section/models/comment.dart';
import 'package:comment_section/providers/comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsList extends ConsumerWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final future = watch(commentsProvider);
    return Scaffold(
        body: future.when(
            data: (data) => RefreshIndicator(
                  onRefresh: () {
                    context.read(refreshesProvider).state++;
                    context.read(indexProvider).state =
                        ++data[data.length - 1].postId;
                    context.read(currentCommentsProvider).state = data;
                    return context.refresh(commentsProvider);
                  },
                  child: Column(
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: () {
                              context.read(refreshesProvider).state = 0;
                              context.read(indexProvider).state = 1;
                              context.read(currentCommentsProvider).state =
                                  [];
                              return context.refresh(commentsProvider);
                            },
                            child: Text(
                                "Press here to reset list to initial state")),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.separated(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                commentContainerBuilder(data[index], context)
                              ],
                            );
                          },
                          separatorBuilder: (context, i) {
                            return SizedBox(height: 8);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, stack) => Text('Error: $e')));
  }

  Widget commentContainerBuilder(Comment comment, BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: CircleAvatar(child: Text("${comment.id}")),
        title: Text("Comment by: ${comment.name}"),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            child: Column(
              children: [
                TextButton(
                    onPressed: () => _showDialog(comment, context),
                    child: Text('Press here to see the comment body')),
                Text("Email: ${comment.email}"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showDialog(Comment comment, BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Message #${comment.id}'),
            content: Text('${comment.body}'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Dismiss'))
            ],
          );
        });
  }
}
