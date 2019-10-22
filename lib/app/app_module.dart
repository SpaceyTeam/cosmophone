import 'package:cosmophone/app/pages/home/home_bloc.dart';
import 'package:cosmophone/app/utils/player_bloc.dart';
import 'package:cosmophone/app/utils/tts_bloc.dart';
import 'package:cosmophone/app/pages/planet_details/planet_details_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:cosmophone/app/app_widget.dart';
import 'package:cosmophone/app/app_bloc.dart';

class AppModule extends ModuleWidget {

  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => PlayerBloc()),
        Bloc((i) => TtsBloc()),
        Bloc((i) => PlanetDetailsBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
