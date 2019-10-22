import 'package:cosmophone/app/app_module.dart';
import 'package:cosmophone/app/models/astro_data.dart';
import 'package:cosmophone/app/pages/home/home_bloc.dart';
import 'package:cosmophone/app/pages/planet_details/planet_details_page.dart';
import 'package:cosmophone/app/utils/player_bloc.dart';
import 'package:cosmophone/app/utils/tts_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var playerBloc = AppModule.to.getBloc<PlayerBloc>();
  var ttsBloc = AppModule.to.getBloc<TtsBloc>();
  var homeBloc = AppModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    homeBloc.startMovementListener();
    playerBloc.start();
    ttsBloc.initTts();
    ttsBloc.speak('Move your phone!');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AstroData>(
        stream: homeBloc.valueOutAstro,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: snapshot.data?.instrumentId != 10 ? Color(0xfff8f8f8) : Color(0xff222222),
            body: GestureDetector(
              onTap: () {
                homeBloc.isShowingAstro = true;
                homeBloc.stopMovementListener();
                playerBloc.setAllMinimalVolume();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlanetDetailsPage(snapshot.data.name.toLowerCase())),
                ).then((v) {
                  homeBloc.isShowingAstro = false;
                  homeBloc.startMovementListener();
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 64.0),
                          child: snapshot.hasData
                              ? Image.asset('assets/images/${snapshot.data.name.toLowerCase()}.png')
                              : Image.asset('assets/images/home.png')),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
