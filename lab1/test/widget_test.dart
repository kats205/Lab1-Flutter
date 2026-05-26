// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lab1/core/app/jobspot_app.dart';

void main() {
  testWidgets('Jobspot app opens on splash screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const JobspotApp());

    expect(find.byType(SvgPicture), findsOneWidget);
  });
}
