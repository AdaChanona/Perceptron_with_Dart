import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as p;
// ignore: unused_import
import 'package:perceptron_with_dart/perceptron_with_dart.dart' as perceptron;
import './neurona.dart';

void main(List<String> arguments) {
  List<String> datos = extraerDatos();
  Random random = Random();
  List<double> pesosIniciales = [];
  List<int> salidas = [];
  var entradas = obtenerDatos(datos, salidas);
  for (var i = 0; i < entradas[0].length; i++) {
    pesosIniciales.add(random.nextDouble());
  }
  var perceptron = Neurona(entradas, salidas, pesosIniciales, 0.1);
  perceptron.entrenar();
  List<double> entradaPrueba = ingresarDatosConsola();
  print(perceptron.predecirValor(entradaPrueba));
}

List<double> ingresarDatosConsola() {
  stdout.writeln('Ingresa el primer valor de entrada: ');
  double entrada1 = double.parse(stdin.readLineSync()!);
  stdout.writeln('Ingresa el segundo valor de entrada: ');
  double entrada2 = double.parse(stdin.readLineSync()!);
  stdout.writeln('Ingresa el tercer valor de entrada: ');
  double entrada3 = double.parse(stdin.readLineSync()!);
  stdout.writeln('Ingresa el cuarto valor de entrada: ');
  double entrada4 = double.parse(stdin.readLineSync()!);

  List<double> entradas = [1, entrada1, entrada2, entrada3, entrada4];
  return entradas;
}

List<String> extraerDatos() {
  var filePath = p.join(Directory.current.path, 'assets', 'iris.data');
  File file = File(filePath);
  var fileContent = file.readAsLinesSync();
  return fileContent;
}

List<List<double>> obtenerDatos(List<String> datos, List<int> salidas) {
  List<List<double>>? entradas = [];
  for (var dato in datos) {
    List<double> entradaTemporal = [1.0];
    var tempDato = dato.split(',');
    for (var i = 0; i < tempDato.length; i++) {
      try {
        entradaTemporal.add(double.parse(tempDato[i]));
      } catch (e) {
        if (tempDato[i] == "Iris-setosa") {
          salidas.add(1);
        } else {
          salidas.add(-1);
        }
      }
    }
    entradas.add(entradaTemporal);
  }

  return entradas;
}
