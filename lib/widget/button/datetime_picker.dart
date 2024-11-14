import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '/extensions.dart';

class DatePicker extends StatefulWidget {
  /// Bu widget'ın en vurucu kısmı, AsyncValueSetter callback'i. Muhteşem bir şey. Normalde 2-3 takla atıp, DatePicker'dan alınan
  /// veriyi parametreye geçirilen değişkene verebilirdim ama burada mis gibi bir yapı var.
  /// Kaybetmek istemediğimden buraya da kaydediyorum.
  const DatePicker({
    required this.hintText,
    required this.initialDate,
    required this.valueSetter,
    super.key,
  });
  final String hintText;
  final DateTime? initialDate;
  final AsyncValueSetter<DateTime> valueSetter;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var result = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          initialDate: DateTime.now(),
        );

        if (result != null) {
          setState(() {
            widget.valueSetter.call(result);
          });
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
      child: Text(widget.initialDate?.formatToString() ?? widget.hintText),
    );
  }
}
