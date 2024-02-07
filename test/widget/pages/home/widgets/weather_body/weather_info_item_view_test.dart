import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_body/weather_info_item_view.dart';

import '../../../../../helpers/test_helper.dart';

void main() {
  Future<void> pumpWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      TestHelper.buildTestWidget(
        child: const WeatherInfoItemView(
          description: 'description',
          assetName: 'assets/sun.svg',
          title: 'title',
        ),
      ),
    );
  }

  testWidgets('renders title description and asset ', (WidgetTester tester) async {
    await pumpWidget(tester);
    expect(find.text('title'), findsOneWidget);
    expect(find.text('description'), findsOneWidget);
  });
}
