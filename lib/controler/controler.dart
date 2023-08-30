import 'dart:async';
import 'package:get/get.dart';

class TimerC extends GetxController {
  var on = false.obs;
  var time = 0.obs;
  var lista = <String>[].obs;

  String get tempoFormatado {
    int h = time.value ~/ 3600;
    int min = (time.value % 3600) ~/ 60;
    int s = time.value % 60;

    String horas = h.toString().padLeft(2, '0');
    String minutos = min.toString().padLeft(2, '0');
    String segundos = s.toString().padLeft(2, '0');

    return '$horas:$minutos:$segundos';
  }

  void start() async {
    on.value = true;
    while (on.value) {
      await Future.delayed(const Duration(milliseconds: 1));
      time.value++;
    }
  }

  void para() {
    on.value = false;
  }

  void marca() {
    lista.add(tempoFormatado);
  }

  void reseta() {
    time.value = 0;
  }
}
