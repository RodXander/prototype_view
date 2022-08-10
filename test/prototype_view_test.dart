import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prototype_view/prototype_view.dart';

void main() {
  testWidgets('Prototype smaller than child', (widgetTester) async {
    await widgetTester.pumpWidget(
      const Center(
        child: PrototypeView(
          prototype: SizedBox(width: 50, height: 40),
          child: SizedBox(width: 100, height: 100),
        ),
      ),
    );

    var size = widgetTester.getSize(find.byType(PrototypeView));
    expect(size.width, 50);
    expect(size.height, 40);
  });

  testWidgets('Prototype bigger than child', (widgetTester) async {
    await widgetTester.pumpWidget(
      const Center(
        child: PrototypeView(
          prototype: SizedBox(width: 100, height: 100),
          child: SizedBox(width: 50, height: 40),
        ),
      ),
    );

    var size = widgetTester.getSize(find.byType(PrototypeView));
    expect(size.width, 50);
    expect(size.height, 40);
  });
}
