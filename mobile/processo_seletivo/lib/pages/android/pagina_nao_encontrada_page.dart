import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaNaoEncontradaPage extends StatelessWidget {
  const PaginaNaoEncontradaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.sadCry, color: Colors.red,size: 32,),
            title: Text("Infelizmente a página que você procurou não está disponível no momento"),
            subtitle: Text("Estamos trabalhando para resolver o quanto antes!"),
          ),
        ),
      ),
    );
  }
}
