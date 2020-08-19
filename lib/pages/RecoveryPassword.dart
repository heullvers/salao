import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:salao/consts/constantes.dart';
import 'package:salao/widgets/buttonInitialPage.dart';

class RecoveryPassword extends StatelessWidget {
  String email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 300, left: 20, right: 20, bottom: 20),
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
                  height: 80,
                ),
                ButtonInitialPage(
                  nomeBotao: 'RECUPERAR',
                  corBotao: Colors.black,
                  corTextoBotao: Colors.white,
                  clickBotao: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
