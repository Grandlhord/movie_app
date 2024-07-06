import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movies.dart';

import 'home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context,state) => const HomePage(),
    ),
    GoRoute(
      path: '/movies',
      builder: (context,state) => const MoviesPage(),
    ),
  ]);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TMDB Movie App',
      theme: ThemeData.dark(),
      routerConfig: _router,
      );
  }
}