import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:flutter_weather_app/pages/home/widgets/weather_failure_view.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.dart';

void main() {
  late WeatherBloc weatherBloc;

  setUpAll(() {
    weatherBloc = MockWeatherBloc();
  });

  Future<void> pumpWidget(WidgetTester tester, {required String error}) async {
    await tester.pumpWidget(
      TestHelper.buildTestWidget(
        child: WeatherFailureView(error: error),
        providers: [
          BlocProvider<WeatherBloc>(
            create: (context) => weatherBloc,
          ),
        ],
      ),
    );
  }

  testWidgets('renders WeatherFailureView when state is WeatherFailure', (WidgetTester tester) async {
    const errorMessage = 'Error message';
    when(weatherBloc.state).thenReturn(WeatherFailure(errorMessage: errorMessage));
    await pumpWidget(tester, error: errorMessage);

    expect(find.byType(WeatherFailureView), findsOneWidget);
    expect(find.text(errorMessage), findsOneWidget);
  });

  testWidgets('renders "Try again" button and triggers FetchWeather event when pressed', (WidgetTester tester) async {
    const errorMessage = 'Error message';
    when(weatherBloc.state).thenReturn(WeatherFailure(errorMessage: errorMessage));
    await pumpWidget(tester, error: errorMessage);

    expect(find.text('Try again'), findsOneWidget);

    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();

    verify(weatherBloc.add(FetchWeather())).called(1);
  });
}
