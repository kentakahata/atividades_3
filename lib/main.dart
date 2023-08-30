import 'package:semana_3/controler/controler.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TimerC _timerc = Get.put(TimerC());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Text(
                  _timerc.tempoFormatado,
                  style: const TextStyle(fontSize: 80),
                );
              }),
              const SizedBox(height: 20),
              Obx(() {
                if (!_timerc.on.value) {
                  return ElevatedButton(
                    onPressed: _timerc.start,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    child: const Text('INICIAR'),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _timerc.para,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: const Text('PARAR'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _timerc.marca,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: const Text('MARCAR'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _timerc.reseta,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                        ),
                        child: const Text('LIMPAR'),
                      ),
                    ],
                  );
                }
              }),
              const SizedBox(height: 20),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _timerc.lista.map((value) {
                    return Text(
                      value,
                      style: TextStyle(color: Colors.brown[100], fontSize: 16),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
