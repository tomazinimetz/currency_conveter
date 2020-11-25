import 'package:currency_converter/domain/currency_converter/UI/value_to_convert_field.dart';
import 'package:currency_converter/domain/currency_converter/bloc/value_to_convert_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('Should build textFormField',
      (WidgetTester tester) async {
    GetIt.I.registerFactory<ValueToConvertBloc>(() => ValueToConvertBloc());
    await pumpWidget(tester);

    expect(find.byType(TextFormField), findsOneWidget);
  });
}

Future pumpWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              ValueToConvertField(),
            ],
          ),
        ),
      ),
    ),
  );
}
