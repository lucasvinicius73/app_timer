import 'package:app_timer/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'pages/pomodoro.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        )
      ],
      child: MaterialApp(
          title: 'Pomodoro',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Pomodoro()),
    );
  }
}
