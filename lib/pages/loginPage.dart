import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:salao/consts/constantes.dart';
import 'package:salao/pages/HomePage.dart';
import 'package:salao/pages/RecoveryPassword.dart';
import 'package:salao/pages/registerPage.dart';
import 'package:salao/widgets/buttonInitialPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;

  String senha;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: MediaQuery.of(context).size.height - 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Você precisa preencher seu e-mail.';
                                  }
                                  final bool isValid =
                                      EmailValidator.validate(value);
                                  if (!isValid) {
                                    return "Email inválido";
                                  }
                                },
                                onSaved: (value) => email = value,
                                decoration: ConstantesApp.decorationInput(
                                    'E-MAIL', Icons.email),
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
                                decoration: ConstantesApp.decorationInput(
                                    'SENHA', Icons.https),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ButtonInitialPage(
                                nomeBotao: 'ENTRAR',
                                corBotao: Colors.black,
                                corTextoBotao: Colors.white,
                                clickBotao: () {
                                  signIn();
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RecoveryPassword()));
                                    },
                                    child: Text(
                                      'Esqueceu sua senha?',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ainda não possui uma conta? ',
                      ),
                      Flexible(
                        child: GestureDetector(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void signIn() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
