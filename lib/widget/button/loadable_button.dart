import 'package:flutter/material.dart';

import '/widget/circular_progress.dart';

class LoadableButton extends StatelessWidget {
  /// Loading animasyonunun çalışabilmesi için, parametreye geçirilen Function'ın `async` ile işaretlenmiş olması ve içerisindeki tüm Future metodların
  /// `await` ile beklenmesi gerekir.
  LoadableButton({
    required this.title,
    required this.onTap,
    this.color = Colors.blue,
    this.heigth = 50,
    this.borderRadius,
    super.key,
  });
  final String title;

  final Color? color;
  final double? heigth;
  final BorderRadiusGeometry? borderRadius;

  final Future<void> Function() onTap;

  final _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth,
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
        animation: _loading,
        builder: (context, _) => Material(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          child: !_loading.value
              ? InkWell(
                  onTap: () async {
                    _loading.value = true;
                    await onTap();
                    _loading.value = false;
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.75,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : const CircularProgress(),
        ),
      ),
    );
  }
}
