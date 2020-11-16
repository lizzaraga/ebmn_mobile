import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoNetworkDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('Network Problem'),
      content: Text('It seems that you are not connected ! Try again'),
      actions: [
        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancel')),
      ],
    );
  }
  
}