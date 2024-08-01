import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderTimeWidget extends SingleChildRenderObjectWidget {
  const RenderTimeWidget({
    super.key,
    super.child,
    required this.name,
  });

  final String name;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderTimeObject(name: name);
  }
}

class _RenderTimeObject extends RenderProxyBox {
  final String name;

  _RenderTimeObject({required this.name});

  @override
  void paint(PaintingContext context, Offset offset) {
    final Stopwatch stopwatch = Stopwatch()..start();
    super.paint(context, offset);
    stopwatch.stop();
    print('Render time $name: ${stopwatch.elapsedMicroseconds} microseconds');
  }
}
