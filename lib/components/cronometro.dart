import 'package:app_timer/components/cronometro_botao.dart';
import 'package:app_timer/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
        builder: (_) => Container(
              color: store.estaTrabalhando() ? Colors.red : Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    store.estaTrabalhando()
                        ? 'Hora de Trabalhar'
                        : 'Hora de Descansar',
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 120, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      if (!store.iniciado)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CronometroBotao(
                            text: 'Iniciar',
                            icone: Icons.play_arrow,
                            click: store.iniciar,
                          ),
                        ),
                      if (store.iniciado)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CronometroBotao(
                            text: 'Parar',
                            icone: Icons.stop,
                            click: store.parar,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CronometroBotao(
                          text: 'Reiniciar',
                          icone: Icons.refresh,
                          click: store.reiniciar,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
