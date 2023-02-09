import 'package:app_timer/components/cronometro.dart';
import 'package:app_timer/components/entrada_tempo.dart';
import 'package:app_timer/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Expanded(child: Cronometro()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  title: 'Trabalho',
                  valor: store.tempoTrabalho,
                  incrementar: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.incrementarTempoTrabalho,
                  decrementar: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.decrementarTempoTrabalho,
                ),
                EntradaTempo(
                  title: 'Descanso',
                  valor: store.tempoDescanso,
                  incrementar: store.iniciado && store.estaDescansando()
                      ? null
                      : store.incrementarTempoDescanso,
                  decrementar: store.iniciado && store.estaDescansando()
                      ? null
                      : store.decrementarTempoDescanso,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
