import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:identity/utils/themes_utils.dart';

part 'theme_data_event.dart';
part 'theme_data_state.dart';

class ThemeDataBloc extends Bloc<ThemeDataEvent, ThemeDataState> {
  ThemeDataBloc() : super(ThemeDataState()) {
    on<AutoThemeEvent>(onAutoThemeEvent);

    startAutoThemeTimer();
  }

  void onAutoThemeEvent(
      AutoThemeEvent event, Emitter<ThemeDataState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final results = await Future.wait([
        Geolocator.getCurrentPosition(
            locationSettings:
                LocationSettings(accuracy: LocationAccuracy.best)),
      ]);

      final Position position = results[0];
      final double latitude = position.latitude;
      final double longitude = position.longitude;

      final sunriseSunset = await _fetchSunriseSunset(latitude, longitude);
      if (sunriseSunset == null) return;

      final now = DateTime.now();
      final sunrise = sunriseSunset['sunrise'];
      final sunset = sunriseSunset['sunset'];

      final isNight = now.isAfter(sunset!) || now.isBefore(sunrise!);
      emit(state.copyWith(
          themeMode: isNight ? ThemeMode.dark : ThemeMode.light,
          isLoading: true));
    } catch (e) {
      print('onAutoThemeEvent error : $e');
      emit(state.copyWith(
          isError: true, errorMessage: e.toString(), isLoading: true));
    }
  }

  Future<Map<String, DateTime>?> _fetchSunriseSunset(
      double lat, double lon) async {
    final result = await compute<List<double>, Map<String, String>?>(
        ThemeUtils.fetchSunriseSunsetInBackground, [lat, lon]);

    return result?.map((key, value) => MapEntry(key, DateTime.parse(value)));
  }

  void startAutoThemeTimer() {
    Timer.periodic(const Duration(minutes: 30), (timer) {
      add(AutoThemeEvent());
    });
  }
}
