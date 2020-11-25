import 'package:currency_converter/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Golden test", (WidgetTester tester) async {
    final text = "Atualizar";
    await tester.pumpWidget(_buildButton(text: text));

    await expectLater(find.byType(CustomButton),
        matchesGoldenFile('goldenTest_CustomButton.png'));
  });

  testWidgets("Should build CustomButton with text",
      (WidgetTester tester) async {
    final text = "Atualizar";
    await tester.pumpWidget(_buildButton(text: text));

    await expectLater(find.widgetWithText(CustomButton, text), findsOneWidget);
  });

  testWidgets("Should call onTap function when tap button",
      (WidgetTester tester) async {
    bool taped = false;
    void onTap() {
      taped = true;
    }

    await tester.pumpWidget(_buildButton(onTap: onTap));
    await tester.tap(find.byType(CustomButton));

    await expectLater(taped, true);
  });
}

Widget _buildButton({String text, Function onTap}) => MaterialApp(
      home: Scaffold(
        body: CustomButton(
          text: text ?? "Atualizar",
          onTap: onTap ?? () {},
        ),
      ),
    );
