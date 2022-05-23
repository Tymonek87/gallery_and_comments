import 'package:flutter/material.dart';
import 'package:the_code_brothers/presentation/pages/styles/dimens.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key, required this.function, required this.message})
      : super(key: key);
  final Function function;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(message),
        FloatingActionButton(
          child: const Padding(
            padding: EdgeInsets.all(Dimens.m),
            child: Center(child: Text('Try again')),
          ),
          onPressed: (() => function()),
        ),
      ]),
    );
  }
}
