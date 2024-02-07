import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constants/app_constants.dart';
import 'package:flutter_weather_app/models/color_asset.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc({required this.assetBundle}) : super(_initialTheme) {
    on<ThemeEvent>((event, emit) async {
      switch (event) {
        case ReadThemeFromAsset():
          try {
            final asset = await assetBundle.loadString(AppConstants.colors);
            final colorAsset = ColorAsset.fromJson(jsonDecode(asset) as Map<String, dynamic>);
            emit(
              state.copyWith(
                dividerColor: _color(colorAsset.divider, state.dividerColor.value),
                scaffoldBackgroundColor: _color(colorAsset.background, state.scaffoldBackgroundColor.value),
                iconTheme: state.iconTheme.copyWith(
                  color: _color(colorAsset.status, state.iconTheme.color?.value ?? 0),
                  size: 20,
                ),
              ),
            );
          } catch (e) {
            debugPrint('Error reading theme from asset: $e');
          }
      }
    });
  }

  static ThemeData get _initialTheme => ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Color _color(String assetColor, int fallbackValue) =>
      Color(int.tryParse(assetColor.replaceAll('#', '0xFF')) ?? fallbackValue);

  final AssetBundle assetBundle;
}
