import 'package:flutter/material.dart';
import 'package:the_code_brothers/models/models.dart';
import 'package:the_code_brothers/presentation/pages/styles/app_typography.dart';
import 'package:the_code_brothers/presentation/pages/styles/dimens.dart';

class DetailScreen extends StatefulWidget {
  final GalleryInfo? value;

  const DetailScreen({Key? key, this.value}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: Dimens.s),
              Padding(
                child: Image.network(widget.value!.url),
                padding: const EdgeInsets.only(bottom: Dimens.s),
              ),
              Padding(
                child: Text(
                  'NAME : ${widget.value!.title}',
                  style: AppTypography.body1,
                  textAlign: TextAlign.left,
                ),
                padding: const EdgeInsets.all(Dimens.l),
              ),
            ],
          ),
        ),
      ),
    );
  }
}