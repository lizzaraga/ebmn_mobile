import 'package:ebmn_mobile/screens/subs-patient-screens/GeneralInfoScreen.dart';
import 'package:ebmn_mobile/screens/subs-patient-screens/LabsScreen.dart';
import 'package:ebmn_mobile/screens/subs-patient-screens/LegalDocumentScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PatientScreen extends StatelessWidget{
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My data"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => GeneralInfoScreen()));
            },
            title: Text("General Information"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LegalDocumentScreen()));
            },
            title: Text("Legal Documents"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LabsScreen()));
            },
            title: Text("Labs"),
            trailing: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
  
}