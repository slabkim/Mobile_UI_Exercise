import 'package:flutter/material.dart';

/// Widget indikator loading dengan CircularProgressIndicator di tengah
class LoadingIndicator extends StatelessWidget {
  /// Ukuran loading indicator
  final double size;

  const LoadingIndicator({super.key, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      /// Loading indicator berukuran sesuai parameter size
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
