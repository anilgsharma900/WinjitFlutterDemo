import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:winjit_lutter_emo/common/widgets/textformfield.dart';

void main() {
  ///case#1 test default
  testWidgets(
    "UiTextFormField default if no parameter passed",
    (WidgetTester tester) async {
      final childWidget = UiTextFormField();
      await tester.pumpWidget(
        MaterialApp(
          home: Material(child: childWidget),
        ),
      );
      await tester.pump();

      // expected output
      expect(find.byType(UiTextFormField), findsOneWidget);
      expect(childWidget.obscuredText, null);
      expect(childWidget.focusNode, null);
      expect(childWidget.textInputType, null);
      expect(childWidget.textInputAction, null);
      expect(childWidget.label, null);
      expect(childWidget.errorHint, null);
      expect(childWidget.onChang, null);
    },
  );

  ///case#2 with values
  testWidgets(
    "UiTextFormField with parameters",
    (WidgetTester tester) async {
      String changedValue = '';
      FocusNode userFocusNode = FocusNode();
      final childWidget = UiTextFormField(
        obscuredText: false,
        focusNode: userFocusNode,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
        label: "User Name",
        errorHint: "Invalid user name",
        onChang: (value) {
          changedValue = value;
        },
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Material(child: childWidget),
        ),
      );
      await tester.pump();

      // expected output
      expect(find.byType(UiTextFormField), findsOneWidget);
      expect(childWidget.obscuredText, false);
      expect(childWidget.focusNode, userFocusNode);
      expect(childWidget.textInputType, TextInputType.text);
      expect(childWidget.textInputAction, TextInputAction.next);
      expect(childWidget.label, "User Name");
      expect(childWidget.errorHint, "Invalid user name");

      await tester.enterText(find.byType(UiTextFormField), "Winjit");
      expect(changedValue, "Winjit");
      changedValue = "";
    },
  );
}
