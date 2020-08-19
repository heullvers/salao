import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:salao/consts/constantes.dart';
import 'package:salao/pages/registerPage.dart';
import 'package:salao/widgets/buttonInitialPage.dart';

class LoginPage extends StatelessWidget {
  String email;
  String senha;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 200, left: 20, right: 20, bottom: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Você precisa preencher seu e-mail.';
                    }
                    final bool isValid = EmailValidator.validate(value);
                    if (!isValid) {
                      return "Email inválido";
                    }
                  },
                  onSaved: (value) => email = value,
                  decoration:
                      ConstantesApp.decorationInput('E-MAIL', Icons.email),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Você precisa preencher sua senha.';
                    }
                  },
                  onChanged: (value) => senha = value,
                  obscureText: true,
                  onSaved: (value) => senha = value,
                  decoration:
                      ConstantesApp.decorationInput('SENHA', Icons.https),
                ),
                SizedBox(
                  height: 50,
                ),
                ButtonInitialPage(
                  nomeBotao: 'ENTRAR',
                  corBotao: Colors.black,
                  corTextoBotao: Colors.white,
                  clickBotao: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ainda não possui uma conta?   ',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
