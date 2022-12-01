import 'package:flutter/material.dart';

class ObscurableTextField extends StatelessWidget {
  ObscurableTextField({
    this.label,
    this.hintText,
    this.textStyle,
    this.labelStyle,
    this.controller,
    this.prefixIcon,
    this.suffixIcon = Icons.remove_red_eye,
    this.obscuringCharacter = '•',
    this.activeColor = Colors.blue,
    this.passiveColor = Colors.grey,
    this.keyboardType = TextInputType.emailAddress,
    this.validator,
    this.border,
    this.enabledBorder,
    super.key,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final String obscuringCharacter;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final Color activeColor;
  final Color passiveColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final InputBorder? enabledBorder;

  final _showPassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _showPassword,
      builder: (context, _) {
        return TextFormField(
          validator: validator,
          controller: controller,
          obscureText: !_showPassword.value,
          obscuringCharacter: obscuringCharacter,
          keyboardType: keyboardType,
          style: textStyle,
          decoration: InputDecoration(
            border: border,
            enabledBorder: enabledBorder,
            labelText: label,
            labelStyle: labelStyle,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              color: _showPassword.value ? activeColor : passiveColor,
              onPressed: () => _showPassword.value = !_showPassword.value,
            ),
          ),
        );
      },
    );
  }
}
