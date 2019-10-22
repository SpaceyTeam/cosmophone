import 'package:cosmophone/app/app_module.dart';
import 'package:cosmophone/app/pages/planet_details/planet_details_bloc.dart';
import 'package:cosmophone/app/utils/tts_bloc.dart';
import 'package:flutter/material.dart';

class PlanetDetailsPage extends StatefulWidget {
  String planetName;

  PlanetDetailsPage(this.planetName);

  @override
  _PlanetDetailsPageState createState() => _PlanetDetailsPageState();
}

class _PlanetDetailsPageState extends State<PlanetDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var ttsBloc = AppModule.to.getBloc<TtsBloc>();
    var planetDetailsBloc = AppModule.to.getBloc<PlanetDetailsBloc>();
    var description = planetDetailsBloc.getDescription(widget.planetName);

    ttsBloc.initTts();
    ttsBloc.speak(widget.planetName).then((value) {
      ttsBloc.speak(description);
    });

    return WillPopScope(
      onWillPop: () async {
        ttsBloc.stop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 64.0),
                  child: Image.asset('assets/images/${widget.planetName.toLowerCase()}.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 16.0, height: 1.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
