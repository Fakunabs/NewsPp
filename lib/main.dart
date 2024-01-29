import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/view/article_sreen.dart';
import 'presentation/bloc/article_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ArticleBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ArticleScreen(),
    );
  }
}
