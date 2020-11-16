import 'dart:io';
import 'dart:ui';

import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/providers/emergencyProviders.dart';
import 'package:ebmn_mobile/screens/DefaultMessageDialog.dart';
import 'package:ebmn_mobile/screens/NoNetworkDialog.dart';
import 'package:ebmn_mobile/src/blocs/AuthBloc.dart';
import 'package:ebmn_mobile/src/blocs/EmergencyBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmergencyDialog extends StatefulWidget{
  @override
  _EmergencyDialogState createState() => _EmergencyDialogState();
}

class _EmergencyDialogState extends State<EmergencyDialog> {
  String problem = "";
  String _token = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt.get<AuthBloc>().authUser.listen((event) {
      _token = event.token;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.redAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Report emergency', style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white
                      ),),
                      SizedBox(height: 8,),
                      Text('If it is urgent, just tap on create to report !', style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ), textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      onChanged: (value) => problem = value,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Specific problem",
                      ),
                    ),
                    SizedBox(height: 16,),
                    MaterialButton(
                      onPressed: (){
                        try {
                          getIt.get<EmergencyBloc>().createEmergency(_token, problem);
                          Navigator.of(context).pop();  
                        } on SocketException catch (e) {
                          showDialog(context: context, builder: (_) => NoNetworkDialog());
                        }
                        catch (_) {
                          showDialog(context: context, builder: (_) => DefaultMessageDialog(
                            title: "Error",
                            content: "An unexpected error occurs ! Please try later",
                          ));
                        }
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      color: Colors.redAccent,
                      child: Text("Create", style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white
                      ),),
                      height: 40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}