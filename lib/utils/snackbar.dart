import 'package:flutter/material.dart';

void successSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green[700],
      margin: const EdgeInsets.all(3),
    ),
  );
}

void failureSnackbar(BuildContext context, String content, {Duration duration = const Duration(seconds: 3)}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red[700],
      margin: const EdgeInsets.all(3),
    ),
  );
}
