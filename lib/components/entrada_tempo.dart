import 'package:app_timer/store/pomodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String title;
  final int valor;
  final void Function()? incrementar;
  final void Function()? decrementar;

  const EntradaTempo(
      {super.key,
      required this.title,
      required this.valor,
      this.incrementar,
      this.decrementar});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: decrementar,
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor:
                      store.estaTrabalhando() ? Colors.red : Colors.green,
                  padding: const EdgeInsets.all(15)),
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            Text(
              '$valor min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: incrementar,
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor:
                      store.estaTrabalhando() ? Colors.red : Colors.green,
                  padding: const EdgeInsets.all(15)),
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
