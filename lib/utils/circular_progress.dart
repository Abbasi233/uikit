import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({this.color = Colors.white, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isIOS) {
      return Center(
        child: CupertinoActivityIndicator(
          color: color,
          radius: 15,
        ),
      );
    }

    return Center(
      child: CircularProgressIndicator(color: color),
    );
  }
}
