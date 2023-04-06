import 'package:baldy_dash_app/service/service_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/race.dart';

class BaldyDashApp extends StatelessWidget {
  const BaldyDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Lobby')),
            body: ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: 1,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                return ListTile(
                  title: FutureBuilder<List<Race>>(
                    future: ServiceRegistry.I.raceService.getRaces(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Race>> snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                            "Failed to fetch race data: ${snapshot.error}");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(snapshot.data!.first.name);
                      }

                      return const Text("Loading...");
                    },
                  ),
                  subtitle: const Text("Race for the cubes!"),
                );
              },
            ),
          );
        },
        '/about': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Race'),
            ),
          );
        }
      },
    );
  }
}
