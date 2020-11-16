import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoUserDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('Authentication'),
      content: Text('Email or password is invalid ! Please try again.'),
      actions: [
        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancel')),
      ],
    );
  }
  
}