import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:salao/consts/constantes.dart';
import 'package:salao/pages/registerPage2.dart';
import 'package:salao/widgets/buttonInitialPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String nome;
  String dataNascimento;
  String numeroTelefone;
  String sexo;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  var maskFormatterData = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
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
                          return 'Você precisa preencher sua data de nascimento';
                        }
                        if (value.length < 10) {
                          return 'Preencha a data de nascimento corretamente';
                        }
                      },
                      onSaved: (value) => dataNascimento = value,
                      maxLength: 10,
                      decoration: ConstantesApp.decorationInput(
                          'DATA DE NASCIMENTO', Icons.cake),
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskFormatterData],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Você precisa preencher seu telefone.';
                        }
                        if (value.length < 15) {
                          return 'Preencha o telefone corretamente';
                        }
                      },
                      onSaved: (value) => numeroTelefone = value,
                      maxLength: 15,
                      keyboardType: TextInputType.number,
                      decoration: ConstantesApp.decorationInput(
                          'TELEFONE', Icons.local_phone),
                      inputFormatters: [maskFormatter],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(6.5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          //aqui pra esquerda
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'SEXO',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 1,
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        setSelectedRadio(value);
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    Text('Masculino'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 2,
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        setSelectedRadio(value);
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    Text('Feminino'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio(
                                      value: 3,
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        setSelectedRadio(value);
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    Text('Outro'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 80,
                    ),
                    ButtonInitialPage(
                      nomeBotao: 'PRÓXIMO',
                      corBotao: Colors.black,
                      corTextoBotao: Colors.white,
                      clickBotao: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPageTwo()));
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
}
