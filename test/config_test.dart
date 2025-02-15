// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:samy_app/config/config_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Default config is set to dev', () {
    final config = ConfigModel.createUsingSystemEnvironment();
    expect(config.environment, dev);
  });
}
