import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/providers/emergencyProviders.dart';
import 'package:ebmn_mobile/screens/mainScreenChildren/EmergencyDialog.dart';
import 'package:ebmn_mobile/src/blocs/EmergencyBloc.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';



class EmergencyScreen extends StatefulWidget{
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt.get<EmergencyBloc>().createLifecycle.listen((event) {
      if(event == TaskLifecycle.inProgress){
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("In progress !"),
            action: SnackBarAction(label: "Hide", onPressed: (){Scaffold.of(context).hideCurrentSnackBar();},),
          ));
    

      }
      else if(event == TaskLifecycle.done){
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Emergency was create !"),
            action: SnackBarAction(label: "Hide", onPressed: (){Scaffold.of(context).hideCurrentSnackBar();},),
          ));
      }
      else if(event == TaskLifecycle.error){
        print("hideCurrentSnackBar ");
        Scaffold.of(context).hideCurrentSnackBar();
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
   
    
    // context.read(emergencyStateProvider).addListener((state) {
    //   if(state.lifecycle == TaskLifecycle.inProgress){
    //     Scaffold.of(context).showSnackBar(SnackBar(
    //         content: Text("In progress !"),
    //         action: SnackBarAction(label: "Hide", onPressed: (){Scaffold.of(context).hideCurrentSnackBar();},),
    //       ));
    

    //   }
    //   if(state.lifecycle == TaskLifecycle.done){
    //     Scaffold.of(context).showSnackBar(SnackBar(
    //         content: Text("Emergency was create !"),
    //         action: SnackBarAction(label: "Hide", onPressed: (){Scaffold.of(context).hideCurrentSnackBar();},),
    //       ));
    //     context.read(createEmergencyLifecycleProvider).state = TaskLifecycle.start;
    //   }
      
    // });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text("Report Emergency"),
      ),
      body: SizedBox.expand(
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                onPressed: () => {showEmergencyDialog(context)},
                height: 100,
                minWidth: 100,
                color: Colors.red[300],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Text('Tap'),
              )
          ],
        ),),
      ),
    );
  }

  showEmergencyDialog(BuildContext context) {
    // final _createEmergency = context.read(createEmergencyProvider("My mobile emmergency"));
    // _createEmergency.whenData((value) => print("When data achieved"));
    // final emergencies = context.read(emergencyListProvider);
    // emergencies.whenData((value){
    //   print.call("Value");
    // });

    showDialog(
      context: context,
      builder: (_){
        return EmergencyDialog();
      }
    );
  }
}