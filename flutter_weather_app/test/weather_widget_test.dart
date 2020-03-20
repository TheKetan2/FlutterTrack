import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:flutter_weather_app/ui/Weather.dart";
import "package:flutter/widgets.dart";

void main() {
  testWidgets("Weather widget test", (WidgetTester tester) async {
    await tester.pumpWidget(Weather());
    expect(find.byType(RichText), findsWidgets);
  });
}
