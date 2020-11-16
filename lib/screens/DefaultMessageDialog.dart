import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultMessageDialog extends StatelessWidget{
  final title, content;

  const DefaultMessageDialog({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Cancel')),
      ],
    );
  }
  
}