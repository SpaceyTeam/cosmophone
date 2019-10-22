import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cosmophone/app/app_module.dart';
import 'package:cosmophone/app/models/astro_data.dart';
import 'package:cosmophone/app/utils/player_bloc.dart';
import 'package:cosmophone/app/utils/tts_bloc.dart';
import 'package:sensors/sensors.dart';

class HomeBloc extends BlocBase {
  var blocPlayer = AppModule.to.getBloc<PlayerBloc>();
  var blocTts = AppModule.to.getBloc<TtsBloc>();
  var _scPlanet = StreamController<AstroData>();
  var _scAccelerometerEvent = StreamController<AccelerometerEvent>();
  Stream<AccelerometerEvent> get valueOutAccelerometer => _scAccelerometerEvent.stream;
  Stream<AstroData> get valueOutAstro => _scPlanet.stream;
  StreamSubscription _ssAccelerometer;
  bool _isShowingAstro = false;
  AstroData _lastAstro;

  set isShowingAstro(bool v) => _isShowingAstro = v;

  var data = [
    AstroData('Makemake', 8.51, 9.81, 'Target', 10),
    AstroData('Eris', 7.20, 8.50, 'Target', 10),
    AstroData('Neptune', 5.89, 7.19, 'Marimba', 5),
    AstroData('Saturn', 4.58, 5.88, 'Timpano', 9),
    AstroData('Mars', 3.27, 4.57, 'Caixa', 8),
    AstroData('Venus', 1.96, 3.26, 'Flauta', 1),
    AstroData('Sun', 0.65, 1.95, 'Piano', 6),
    AstroData('Mercury', -0.66, 0.64, 'Violino', 2),
    AstroData('Moon', -1.97, -0.67, 'Violoncelo', 3),
    AstroData('Jupiter', -3.28, -1.98, 'Baixo', 4),
    AstroData('Uranus', -4.59, -3.29, 'Xilofone', 0),
    AstroData('Pluto', -5.90, -4.60, 'Coral', 7),
    AstroData('Haumea', -7.21, -5.91, 'Target', 10),
    AstroData('Quaoar', -8.52, -7.22, 'Target', 10)
  ];



  void startMovementListener() {
    _ssAccelerometer = accelerometerEvents.listen((AccelerometerEvent event) {
      print(event.z);

      var astro = data.firstWhere((e) => event.z >= e.lowerZ && event.z <= e.upperZ, orElse: () => null);

      if (astro != null) {
        stopMovementListener();

        Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
          for (var i = 0; i < 10; i++) {
            if (astro.instrumentId == 10) {
              if (_lastAstro != null && (_lastAstro.name ?? '') != astro.name) blocTts.speak('Target found!');
            } else if (astro.instrumentId != i)
              blocPlayer.setVolume(i, 0.05);
            else
              blocPlayer.setVolume(i, 1);
          }

          _lastAstro = astro;
          _scPlanet.add(astro);

          if (!_isShowingAstro) startMovementListener();
        });
      }
    });
  }

  void stopMovementListener() {
    _ssAccelerometer.cancel();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _ssAccelerometer.cancel();
    super.dispose();
  }
}
