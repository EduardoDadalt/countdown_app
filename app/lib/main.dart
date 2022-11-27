import 'package:countdown_app/homepage/controller/countdown_controller.dart';
import 'package:countdown_app/homepage/infra/countdown_repository.dart';
import 'package:countdown_app/homepage/infra/datasource/local_countdown_datasource.dart';
import 'package:countdown_app/homepage/view/homepage.dart';
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
    final localCountdownDatasource = LocalCountdownDatasource();

    final countdownRepository = CountdownRepository(
      localDatasource: localCountdownDatasource,
    );

    final countdownController = CountdownController(
      countdownRepository: countdownRepository,
    );

    return ChangeNotifierProvider(
      create: (_) => countdownController,
      child: MaterialApp(
        title: 'Counter App',
        theme: theme,
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
