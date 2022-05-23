import 'package:flutter/material.dart';

import 'package:the_code_brothers/presentation/styles/app_typography.dart';
import 'package:the_code_brothers/presentation/styles/dimens.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key, required this.function, required this.message})
      : super(key: key);
  final Function function;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        message,
        style: AppTypography.h2,
      ),
      const SizedBox(
        height: Dimens.m,
      ),
      ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(Dimens.m),
          child: Text('Try again'),
        ),
        onPressed: (() => function()),
      ),
    ]);
  }
}
