import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Dados'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o valor da gasolina",
              ),
              maxLength: 4,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              /*onSubmitted: (String texto) {
              },*/
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
