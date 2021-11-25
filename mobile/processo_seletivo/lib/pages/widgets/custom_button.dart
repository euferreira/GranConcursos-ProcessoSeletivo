import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:processo_seletivo/pages/widgets/custom_progress.dart';

class CustomButton extends StatelessWidget {
  final Function _function;
  final bool _showProgress;
  final String _text;
  final Color _colorProgress;
  final bool _enabled;

  CustomButton(this._function, this._showProgress, this._text, this._colorProgress, this._enabled, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 180,
      child: ElevatedButton(
        onPressed: _enabled ? _function : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          visualDensity: VisualDensity.comfortable,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: Colors.red),
            )
          )
        ),
        child: _showProgress ? CustomProgress(_colorProgress) : Text(_text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
