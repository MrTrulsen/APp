import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget{
  FancyButton({@required this.onPressed});
 
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
  return new RawMaterialButton(
    fillColor: Color(0xFFe5a900),
    splashColor: Colors.orange,
    child: Text("Login"),
    onPressed: onPressed,
  );
  }

}