import 'package:flutter_test/flutter_test.dart';
import 'package:workwell/app/app.dart';

void main() {
  testWidgets('WorkWell app loads login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const WorkwellApp());

    expect(find.text('WorkWell BPHN'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });
}
