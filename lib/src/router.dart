import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnflutter/src/pages/home_page.dart';
import 'package:learnflutter/src/pages/login_page.dart';

class MainRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginPage());
        },
      ),
    ]
  );

  get getRouter {
    return router;
  }
}