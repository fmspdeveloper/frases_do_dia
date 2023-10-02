import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: frasesDoDia(),
  ));
}

class frasesDoDia extends StatefulWidget {
  const frasesDoDia({super.key});

  @override
  State<frasesDoDia> createState() => _frasesDoDiaState();
}

class _frasesDoDiaState extends State<frasesDoDia> {
  var _titulo = "Frases do dia";
  var _frases = ["frase1", "frase2", "frase3"];
  var _fraseAtual = "clique em 'nova frase";

  void _gerarFrasesAleatorias() {
    final random = Random();
    final indice = random.nextInt(_frases.length);

    setState(() {
      _fraseAtual = _frases[indice];
    });
  }

  void _resetFrase() {
    setState(() {
      _fraseAtual = "clique em uma 'nova frase'";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titulo,
          style: TextStyle(color: Colors.lightGreenAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: _resetFrase, icon: Icon(Icons.refresh))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "image/logo.png",
            fit: BoxFit.scaleDown,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Text(
              _fraseAtual,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ElevatedButton(
              onPressed: _gerarFrasesAleatorias,
              child: Text(
                "Nova Frese",
                style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
