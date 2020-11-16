import 'dart:io';

import 'package:ebmn_mobile/data/models/EmergencyModel.dart';
import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/screens/DefaultMessageDialog.dart';
import 'package:ebmn_mobile/screens/NoNetworkDialog.dart';
import 'package:ebmn_mobile/src/blocs/AuthBloc.dart';
import 'package:ebmn_mobile/src/blocs/EmergencyBloc.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:flutter/material.dart';

import 'ExitAppDialog.dart';

class ClerkScreen extends StatefulWidget {
  @override
  _ClerkScreenState createState() => _ClerkScreenState();
}

class _ClerkScreenState extends State<ClerkScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt.get<EmergencyBloc>().updateLifecycle.listen((event) {
      if(event == TaskLifecycle.inProgress){
        
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Updating ..."), duration: Duration(milliseconds: 500),
            action: SnackBarAction(label: "Hide", onPressed: (){Scaffold.of(context).hideCurrentSnackBar();},),
          ));
          

      } 
      else if(event == TaskLifecycle.done){
         _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text("Update done !"),
            action: SnackBarAction(label: "Hide", onPressed: (){_scaffoldKey.currentState.hideCurrentSnackBar();},),
          ));
      }
      else if(event == TaskLifecycle.error){
        print("hideCurrentSnackBar ");
        _scaffoldKey.currentState.hideCurrentSnackBar();
      }
    });
    getIt.get<EmergencyBloc>().exception.listen((event) {
      print('Listen ${event.runtimeType.toString()}');
      switch (event.runtimeType) {
        case SocketException:
          showDialog(context: context, builder: (_) => NoNetworkDialog());
          break;
        default:
           showDialog(context: context, builder: (_) => DefaultMessageDialog(
             title: "Error",
             content: "An unexpected error occurs ! Check your connection or try again later.",
           ));
        
      }
    });
    getEmergencies();
  }

  void getEmergencies() {
     getIt.get<AuthBloc>().authUser.listen((event) {
      getIt.get<EmergencyBloc>().getClerkEmergencies(event.token);
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return showDialog(context: context, builder: (_) => ExitAppDialog());
        
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("My Data"),
          centerTitle: true,
          leading: Container(),
        ),
        body: StreamBuilder<List<EmergencyModel>>(
          initialData: [],
          stream: getIt.get<EmergencyBloc>().emergencies,
          builder: (context, asyncValue){
            if(asyncValue.hasError){
              showDialog(context: context, builder: (context) => NoNetworkDialog());
              return Column(
                children: [
                  FlatButton(onPressed:  getEmergencies, child: Text('Retry'))
                ],
              );
            }
            else if(asyncValue.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else{
              return ListView.builder(
                itemCount: asyncValue.data.length,
                itemBuilder: (context, index){
                  final item = asyncValue.data[index];
                  return ListTile(
                    onTap: (){
                      getIt.get<AuthBloc>().authUser.listen((event) {
                        getIt.get<EmergencyBloc>().updateEmergency(item, event.token);
                      });
                    },
                    title: Text(item.username),
                    subtitle: Text(item.specificProblem),
                    trailing: item.emergencyStatus.toLowerCase() != "treated"
                     ? Icon(Icons.check, color: Colors.grey[300])
                     : Icon(Icons.check, color: Colors.blue),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}