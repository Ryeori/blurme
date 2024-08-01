import 'dart:ui';

import 'package:flutter/rendering.dart';

class BlurmeRenderBox extends RenderProxyBox {
  BlurmeRenderBox({
    required this.blurriness,
    required this.tileMode,
  });

  /// Value for blurriness level
  ///
  /// if 0 then [ ImageFilter.blur ] won't paint at all
  double blurriness;

  /// Tile mode for [ImageFilter.blur]
  TileMode tileMode;

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    final Canvas canvas = context.canvas;

    if (child == null) {
      return;
    }

    if (blurriness == 0) {
      context.paintChild(child, offset);
      canvas.restore();
      return;
    }

    final Paint paint = Paint()
      ..imageFilter = ImageFilter.blur(
        sigmaX: blurriness,
        sigmaY: blurriness,
        tileMode: tileMode,
      );

    canvas.saveLayer(offset & size, paint);
    context.paintChild(child, offset);
    canvas.restore();
  }
}
