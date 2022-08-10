import 'dart:ui';

import 'package:boxy/boxy.dart';

/// Delegate that takes over the layout and paint operations for [PrototypeView].
///
/// It uses an offstage prototype widget's size to constraint the child widget.
/// If the size of the child itself is smaller than the constraints it'll wrap around the child.
class PrototypeViewDelegate extends BoxyDelegate {
  @override
  void paintChildren() => getChild(#child).paint();

  @override
  Size layout() {
    Size prototypeViewSize;
    if (hasChild(#prototype)) {
      var prototypeSize = getChild(#prototype).layout(constraints);
      prototypeViewSize = getChild(#child).layout(constraints.copyWith(
        maxWidth: prototypeSize.width,
        maxHeight: prototypeSize.height,
      ));
    } else {
      prototypeViewSize = getChild(#child).layout(constraints);
    }
    return prototypeViewSize;
  }
}
