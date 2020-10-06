import 'package:flutter/material.dart';
import 'package:salao/consts/constantes.dart';
import 'package:salao/pages/loginPage.dart';
import 'package:salao/pages/registerPage2.dart';
import 'package:salao/widgets/buttonInitialPage.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ConstantesApp.fundoTelaLogin),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: ButtonInitialPage(
                  nomeBotao: 'LOGIN',
                  corBotao: Colors.white,
                  corTextoBotao: Colors.black,
                  clickBotao: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, top: 10, left: 20, right: 20),
                child: ButtonInitialPage(
                  nomeBotao: 'CADASTRAR',
                  corBotao: Colors.black,
                  corTextoBotao: Colors.white,
                  clickBotao: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPageTwo()));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
