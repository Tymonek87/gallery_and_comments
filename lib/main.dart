import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_code_brothers/presentation/pages/comments/cubit/comments_cubit.dart';
import 'package:the_code_brothers/presentation/pages/gallery/cubit/gallery_cubit.dart';
import 'package:the_code_brothers/presentation/pages/main/home_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GalleryCubit()..getGallery(),
        ),
        BlocProvider(
          create: (context) => CommentsCubit()..getComments(),
        ),
      ],
      child: const HomePage(),
    ));
  }
}
