import 'package:flutter/material.dart';

class ButtonInitialPage extends StatefulWidget {
  final nomeBotao;
  final corBotao;
  final corTextoBotao;
  final clickBotao;

  const ButtonInitialPage(
      {this.nomeBotao, this.corBotao, this.corTextoBotao, this.clickBotao});

  @override
  _ButtonInitialPageState createState() => _ButtonInitialPageState();
}

class _ButtonInitialPageState extends State<ButtonInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ButtonTheme(
            height: 50,
            child: FlatButton(
                onPressed: widget.clickBotao,
                color: widget.corBotao,
                textColor: widget.corTextoBotao,
                shape: Border.all(width: 1.5, color: Colors.black),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.nomeBotao,
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
