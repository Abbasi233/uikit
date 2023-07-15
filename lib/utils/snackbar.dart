import 'package:get/get.dart';
import 'package:flutter/material.dart';

void successSnackbar(String content) {
  Get.snackbar(
    "İşlem Başarılı",
    content,
    backgroundColor: Colors.green[700],
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(3),
    animationDuration: const Duration(milliseconds: 300),
  );
}

void failureSnackbar(String content, {Duration duration = const Duration(seconds: 3)}) {
  Get.snackbar(
    "İşlem Başarısız",
    content,
    backgroundColor: Colors.red[700],
    colorText: Colors.white,
    duration: duration,
    animationDuration: const Duration(milliseconds: 300),
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(5),
  );
}
