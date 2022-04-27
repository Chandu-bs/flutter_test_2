import 'package:flutter/material.dart';
import 'package:flutter_test_2/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Checking the appbar and dice functionality by tapping the image",
    (WidgetTester tester) async {
      //Arrange
      app.main();
      await tester.pumpAndSettle();

      var myButton = find.byKey(const Key('diceImage'));

      //Act

      await tester.tap(myButton);
      await tester.pumpAndSettle();

      List<String> imageNames = [
        'dice1.png',
        'dice2.png',
        'dice3.png',
        'dice4.png',
        'dice5.png',
        'dice6.png',
      ];
      var count = 0;

      for (String image in imageNames) {
        var matchings =
            tester.widgetList(find.image(AssetImage("images/$image"))).length;
        count = count + matchings;
      }

      await Future.delayed(const Duration(seconds: 4));

      //Assert

      expect(find.text('Dicee'), findsOneWidget);
      expect(count, 2);
    },
  );
}
