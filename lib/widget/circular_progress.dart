import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({this.color = Colors.white, super.key});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Center(
        child: CircularProgressIndicator(color: color),
      );
    }

    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: 15,
      ),
    );
  }
}
