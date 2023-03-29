import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:baldy_dash_app/model/app_state_model.dart';

class RaceTab extends StatelessWidget {
  const RaceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Race'),
            ),
          ],
        );
      },
    );
  }
}