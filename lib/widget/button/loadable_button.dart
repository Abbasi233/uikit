import 'package:flutter/material.dart';

import '/utils/circular_progress.dart';

class LoadableButton extends StatelessWidget {
  /// Loading animasyonunun çalışabilmesi için, parametreye geçirilen
  /// Function'ın `async` ile işaretlenmiş olması ve içerisindeki tüm
  /// Future metodların `await` ile beklenmesi gerekir.
  LoadableButton({
    required this.title,
    required this.onTap,
    this.icon,
    this.borderRadius,
    this.height = 50,
    this.color = Colors.blue,
    this.circularColor = Colors.white,
    super.key,
  });

  final String title;
  final Widget? icon;
  final Color? color;
  final Color? circularColor;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  final Future<void> Function() onTap;

  final _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AnimatedBuilder(
        animation: _loading,
        builder: (context, _) => Material(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          child: !_loading.value
              ? InkWell(
                  onTap: () async {
                    if (_loading.value == false) {
                      _loading.value = true;
                      await onTap();
                      _loading.value = false;
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: icon,
                            ),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.75,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : CircularProgress(color: circularColor),
        ),
      ),
    );
  }
}
