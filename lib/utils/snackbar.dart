import 'package:flutter/material.dart';

void successSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green[700],
      margin: const EdgeInsets.fromLTRB(3, 3, 3, 10),
      duration: const Duration(seconds: 6),
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
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red[700],
      margin: const EdgeInsets.fromLTRB(3, 3, 3, 10),
      duration: const Duration(seconds: 6),
    ),
  );
}
