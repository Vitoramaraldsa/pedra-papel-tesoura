import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JogoState();
  }

}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Escolha uma opção abaixo: ";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    int numeroAleatorio = Random().nextInt(3);
    String escolhaMaquina = opcoes[numeroAleatorio];

    if (escolhaUsuario == escolhaMaquina) {
      setState(() {
        _resultadoFinal = "Empate";
      });
    } else if (escolhaUsuario == "papel") {
      if (escolhaMaquina == "pedra") {
        setState(() {
          _resultadoFinal = "Vitória";
        });
      } else {
        setState(() {
          _resultadoFinal = "Derrota";
        });
      }
    } else if (escolhaUsuario == "tesoura") {
      if (escolhaMaquina == "papel") {
        setState(() {
          _resultadoFinal = "Vitória";
        });
      } else {
        setState(() {
          _resultadoFinal = "Derrota";
        });
      }
    } else if (escolhaUsuario == "pedra") {
      if (escolhaMaquina == "tesoura") {
        setState(() {
          _resultadoFinal = "Vitória";
        });
      } else {
        setState(() {
          _resultadoFinal = "Derrota";
        });
      }
    }

      switch (escolhaMaquina) {
        case "pedra":
          setState(() {
            this._imagemApp = AssetImage("images/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            this._imagemApp = AssetImage("images/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            this._imagemApp = AssetImage("images/tesoura.png");
          });
          break;
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: Text("Pedra papel ou tesoura"),
              backgroundColor: Colors.deepOrange),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: Text("Ecolha do App: ", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center)
              ),
              Image(image: this._imagemApp),
              Padding(padding: EdgeInsets.only(top: 0, bottom: 0),
                  child: Text(this._resultadoFinal, style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset("images/pedra.png", height: 95),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset("images/papel.png", height: 95),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 95),
                  ),

                ],
              )
            ],
          )
      );
    }
  }
