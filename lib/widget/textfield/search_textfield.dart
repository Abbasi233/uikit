import 'dart:async';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    this.debounceTime = const Duration(milliseconds: 350),
    this.label,
    this.hintText,
    this.textStyle,
    this.labelStyle,
    this.controller,
    this.prefixIcon,
    this.decoration,
    this.keyboardType,
    required this.onSearched,
    this.border,
    this.enabledBorder,
    super.key,
  });
  final Duration debounceTime;
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final InputDecoration? decoration;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Future<void> Function() onSearched;
  final InputBorder? border;
  final InputBorder? enabledBorder;

  Timer? _debounceTimer;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: textStyle,
      controller: controller,
      keyboardType: keyboardType,
      decoration: decoration ??
          InputDecoration(
            border: border,
            enabledBorder: enabledBorder,
            labelText: label,
            labelStyle: labelStyle,
            hintText: hintText,
            prefixIcon: prefixIcon,
          ),
      onChanged: (value) => _search(value, onSearched),
    );
  }

  void _search(String keyword, Future<void> Function() function) {
    _debounceTimer?.cancel();
    if (keyword.isNotEmpty) {
      _debounceTimer = Timer.periodic(debounceTime, (_) async {
        await function();
        _debounceTimer?.cancel();
      });
    }

    // _debounceTimer?.cancel();
    // if (keyword.isNotEmpty) {
    //   _debounceTimer = Timer(
    //     debounceTime,
    //     () {
    //       _debounceTimer?.cancel();
    //       function();
    //     },
    //   );
    // }
  }
}
