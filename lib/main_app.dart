import 'package:comment_section/ui/pages/comments_page.dart';
import 'package:comment_section/ui/pages/new_comment_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerConfig: _router ,
  );
    final GoRouter _router = GoRouter(routes: <GoRoute>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => CommentsPage(),
      routes: <GoRoute>[
        GoRoute(
            path: 'newcommentpage',
            builder: (BuildContext context, GoRouterState state) =>
                NewCommentPage())
      ])
]);
}
