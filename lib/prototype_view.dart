library prototype_view;

import 'package:boxy/boxy.dart';
import 'package:flutter/widgets.dart';
import 'package:prototype_view/prototype_view_delegate.dart';

/// Widget that constraints its [child] to the size set by [prototype].
/// If [prototype] is null or [child] is smaller than its constraints then this widget will wrap around it.
class PrototypeView extends StatelessWidget {
  const PrototypeView({
    Key? key,
    required this.child,
    this.prototype,
  }) : super(key: key);

  final Widget child;

  /// This is the offstage widget that sets the size that'll inform the constraints passed down to [child].
  /// The constraint it receives during layout will be the same as the [PrototypeView] itself.
  /// It can be null, in which case [PrototypeView] will wrap around its [child].
  final Widget? prototype;

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
      delegate: PrototypeViewDelegate(),
      children: [
        if (prototype != null)
          BoxyId(
            id: #prototype,
            child: prototype!,
          ),
        BoxyId(
          id: #child,
          child: child,
        ),
      ],
    );
  }
}
