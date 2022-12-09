import 'dart:io';

import 'package:countdown_app/api/api.dart';
import 'package:countdown_app/countdown/controller/countdown_controller.dart';
import 'package:countdown_app/countdown/infra/countdown_repository.dart';
import 'package:countdown_app/countdown/infra/datasource/local_countdown_datasource.dart';
import 'package:countdown_app/homepage/view/homepage.dart';
import 'package:countdown_app/store/controller/store_controller.dart';
import 'package:countdown_app/store/infra/datasource/online_store_datasource.dart';
import 'package:countdown_app/store/infra/store_repository.dart';
import 'package:countdown_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          final localCountdownDatasource = LocalCountdownDatasource();

          final countdownRepository = CountdownRepository(
            localDatasource: localCountdownDatasource,
          );

          final countdownController = CountdownController(
            countdownRepository: countdownRepository,
          );
          return countdownController;
        }),
        ChangeNotifierProvider(create: (_) {
          final API api = API();

          final OnlineStoreDatasource onlineStoreDatasource =
              OnlineStoreDatasource(api);

          final StoreRepository storeRepository =
              StoreRepository(onlineStoreDatasource);

          final StoreController storeController =
              StoreController(storeRepository);

          return storeController;
        }),
      ],
      child: MaterialApp(
        title: 'Counter App',
        theme: theme,
        locale: Locale(Platform.localeName),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const Homepage(),
      ),
    );
  }
}
