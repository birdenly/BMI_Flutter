import 'package:flutter/material.dart';

void main() {
  runApp(const calcularIMC());
}

class calcularIMC extends StatefulWidget {
  const calcularIMC({super.key});

  @override
  calcularIMCState createState() => calcularIMCState();
}

class calcularIMCState extends State<calcularIMC> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  double imcTotal = 0.0;
  IMC atributos =
      IMC(imc: '', cor: Colors.black, imagemUrl: 'images/constructor.PNG');

  void calculadora() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    double heightInMeters = altura / 100;
    double imc = peso / (heightInMeters * heightInMeters);

    if (imc < 18.5) {
      atributos = DUMMY_IMC[0];
    } else if (imc >= 18.5 && imc < 25) {
      atributos = DUMMY_IMC[1];
    } else if (imc >= 25 && imc < 30) {
      atributos = DUMMY_IMC[2];
    } else if (imc >= 30 && imc < 35) {
      atributos = DUMMY_IMC[3];
    } else if (imc >= 35 && imc < 40) {
      atributos = DUMMY_IMC[4];
    } else if (imc > 40) {
      atributos = DUMMY_IMC[5];
    }

    setState(() {
      imcTotal = imc;
      atributos = atributos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC APP',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculo de IMC'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura em Cm',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso em Kg',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  calculadora();
                },
                child: const Text('Calcular IMC'),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Resultado: ${imcTotal.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 20.0, color: atributos.cor),
              ),
              Text(
                atributos.imc,
                style: TextStyle(fontSize: 15.0, color: atributos.cor),
              ),
              Container(
                height: 100,
                width: 100,
                child: Image.asset(atributos.imagemUrl),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IMC {
  final String imc;
  final Color cor;
  final String imagemUrl;

  const IMC({
    required this.imc,
    required this.cor,
    required this.imagemUrl,
  });
}

const DUMMY_IMC = [
  IMC(imc: 'Abaixo do Peso', cor: Colors.blue, imagemUrl: 'images/abaixo.PNG'),
  IMC(imc: 'Peso Normal', cor: Colors.green, imagemUrl: 'images/normal.PNG'),
  IMC(imc: 'Sobrepeso', cor: Colors.yellow, imagemUrl: 'images/sobre.PNG'),
  IMC(
      imc: 'Obesidade Grau I',
      cor: Color.fromARGB(255, 109, 99, 14),
      imagemUrl: 'images/obesidade1.PNG'),
  IMC(
      imc: 'Obesidade Grau II',
      cor: Colors.orange,
      imagemUrl: 'images/obesidade2.PNG'),
  IMC(
      imc: 'Obesidade Mórbida',
      cor: Colors.red,
      imagemUrl: 'images/obesidade3.PNG'),
];
