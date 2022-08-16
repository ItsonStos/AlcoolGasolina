import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = '';

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text) ?? 0;
    double precoGasolina = double.tryParse(_controllerGasolina.text) ?? 0;

    if (precoGasolina <= 0) {
      setState(() {
        _textoResultado = 'Preço inválido, digite um valor maior que 0 e utilizando (.)';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = 'Abasteça com gasolina';
        });
      } else {
        setState(() {
          _textoResultado = 'Abasteça com álcool';
        });
      }
      FocusManager.instance.primaryFocus?.unfocus();
      //limparCampos();
    }
  }

  void limparCampos() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Álcool ou Gasolina?',
        textAlign: TextAlign.right,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset(
              'images/gasolina-alcool.png'
              //'images/logo.png',
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Saiba qual a melhor opção de combustivel é mais vantajoso para abastecer o seu veículo.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controllerAlcool,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Preço do Álcool', hintText: 'Digite aqui'),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextField(
                        controller: _controllerGasolina,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Preço do Gasolina',
                          hintText: 'Digite aqui',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(                    
                    onPressed: _calcular,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                    child: const Text(
                      'Verificar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
