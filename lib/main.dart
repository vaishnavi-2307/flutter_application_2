
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/albmus_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/services.dart';
import 'bloc/api_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
        child: AlbumsScreen(),
      ),
    );
  }
}
