class Neurona {
  List<List<double>> entradas = [];
  List<int> salidas = [];
  double taza = 0;
  List<double> pesos = [];

  Neurona(List<List<double>> entradas, List<int> salidas, List<double> pesos,
      double taza) {
    this.entradas = entradas;
    this.salidas = salidas;
    this.pesos = pesos;
    this.taza = taza;
  }

  List<double>? entrenar() {
    int contador = 0;
    while (contador < this.entradas.length) {
      List<double> entradaN = this.entradas[contador];
      int yObtenida = funcionActivacion(entradaN, this.pesos);
      int salidaEsperada = this.salidas[contador];
      int error = salidaEsperada - yObtenida;
      if (error == 0) {
        contador++;
      } else {
        for (var i = 0; i < this.pesos.length; i++) {
          this.pesos[i] = this.pesos[i] + (taza * error * entradaN[i]);
        }
        contador = 0;
      }
    }
    return this.pesos;
  }

  int funcionActivacion(List<double> entrada, List<double> pesos) {
    var y = 0;
    double resultado = 0.0;
    for (var i = 0; i < entrada.length; i++) {
      resultado = resultado + (entrada[i] * pesos[i]);
    }
    y = (resultado >= 0) ? 1 : -1;
    return y;
  }

  String predecirValor(List<double> entrada) {
    int resultado = funcionActivacion(entrada, this.pesos);
    return (resultado >= 0) ? "Iris-setosa" : "Iris-versicolor";
  }

  void getNumber() {
    print(10);
  }
}
