import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/blocs/blocs.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.dart';

void main() {
  late MockAssetBundle assetBundle;
  setUpAll(() {
    assetBundle = MockAssetBundle();
  });

  blocTest<ThemeBloc, ThemeData>(
    'emits initial ThemeData initially',
    build: () => ThemeBloc(assetBundle: assetBundle),
    verify: (bloc) {
      expect(
        bloc.state,
        isA<ThemeData>().having((p0) => p0.useMaterial3, 'should have useMaterial3', true),
      );
      expect(
        bloc.state,
        isA<ThemeData>().having((p0) => p0.textTheme.titleMedium?.fontSize, 'should have 18 fontSize', 18),
      );
    },
  );

  blocTest<ThemeBloc, ThemeData>(
    'emits ThemeData with values when ReadThemeFromAsset is added',
    build: () {
      when(assetBundle.loadString(any))
          .thenAnswer((_) async => '{"status": "#C1C7CC", "divider": "#8A9097", "background": "#FFFFFF"}');
      return ThemeBloc(assetBundle: assetBundle);
    },
    act: (bloc) => bloc.add(ReadThemeFromAsset()),
    expect: () => [
      isA<ThemeData>()
          .having(
            (p0) => p0.dividerColor,
            'divider color check',
            const Color(0xff8A9097),
          )
          .having(
            (p0) => p0.scaffoldBackgroundColor,
            'scaffold background color check',
            const Color(0xFFFFFFFF),
          )
          .having(
            (p0) => p0.iconTheme.color,
            'status color check',
            const Color(0xFFC1C7CC),
          ),
    ],
  );
}
