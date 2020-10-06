import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:salao/consts/constantes.dart';
import 'package:salao/pages/loginPage.dart';
import 'package:salao/widgets/buttonInitialPage.dart';

class RegisterPageTwo extends StatefulWidget {
  @override
  _RegisterPageTwoState createState() => _RegisterPageTwoState();
}

class _RegisterPageTwoState extends State<RegisterPageTwo> {
  String nome;
  String email;
  String senha;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Você precisa preencher seu nome';
                        }
                      },
                      onSaved: (value) => nome = value,
                      decoration: ConstantesApp.decorationInput(
                          'NOME', Icons.insert_emoticon),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                        if (value.length < 6) {
                          return 'Sua senha deve ter no mínimo 6 caracteres';
                        }
                      },
                      onChanged: (value) => senha = value,
                      obscureText: true,
                      onSaved: (value) => senha = value,
                      decoration:
                          ConstantesApp.decorationInput('SENHA', Icons.https),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Você precisa confirmar sua senha.';
                        }
                        if (value != senha) {
                          return 'As senhas não coincidem';
                        }
                      },
                      obscureText: true,
                      decoration: ConstantesApp.decorationInput(
                          'CONFIRMAR SENHA', Icons.https),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    ButtonInitialPage(
                      nomeBotao: 'CRIAR CONTA',
                      corBotao: Colors.black,
                      corTextoBotao: Colors.white,
                      clickBotao: () {
                        signUp();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
