library blurme;

import 'package:blurme/bluerme_render_box.dart';
import 'package:flutter/widgets.dart';

/// Render object implementation for blurring
class Blurme extends SingleChildRenderObjectWidget {
  const Blurme({
    super.key,
    super.child,
    required this.blurriness,
    this.tileMode = TileMode.decal,
  });

  /// Value for blurriness level
  ///
  /// if 0 then [ ImageFilter.blur ] won't paint at all
  final double blurriness;

  /// Tile mode for [ImageFilter.blur]
  final TileMode tileMode;

  @override
  void updateRenderObject(
      BuildContext context, covariant BlurmeRenderBox renderObject) {
    if (blurriness == renderObject.blurriness) return;

    renderObject.blurriness = blurriness;
    renderObject.tileMode = tileMode;
    super.updateRenderObject(context, renderObject);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return BlurmeRenderBox(
      blurriness: blurriness,
      tileMode: tileMode,
    );
  }
}
