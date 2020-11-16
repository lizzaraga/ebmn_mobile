import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExitAppDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('Exit app'),
      content: Text('Are you sure you want to quit the application ?'),
      actions: [
        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancel')),
        FlatButton(onPressed: (){exit(0);}, child: Text('Yes')),
      ],
    );
  }
  
}