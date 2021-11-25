import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String _titulo;
  final String _descricao;
  final Function _function;

  CustomCard(this._titulo, this._descricao, this._function, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 20,
            color: Colors.grey,
          ),
          ListTile(
            title: Text(_titulo),
            subtitle: Text(_descricao),
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: [
              TextButton(onPressed: _function, child: Text("Ver mais")),
            ],
          ),
        ],
      ),
    );
  }
}
