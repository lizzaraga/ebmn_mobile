import 'package:ebmn_mobile/data/models/EmergencyModel.dart';
import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/providers/emergencyProviders.dart';
import 'package:ebmn_mobile/src/blocs/AuthBloc.dart';
import 'package:ebmn_mobile/src/blocs/EmergencyBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../NoNetworkDialog.dart';

class HistoryScreen extends HookWidget{

  void getHistories() {
      getIt.get<AuthBloc>().authUser.listen((event) {
      getIt.get<EmergencyBloc>().getEmergencies(event.token);
    });
  }

  @override
  Widget build(Object context) {
    // TODO: implement build
    useEffect((){
       getHistories();
       return;
    }, []);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My history"),
      ),
      body: SizedBox.expand(
        child: StreamBuilder<List<EmergencyModel>>(
          initialData: [],
          stream: getIt.get<EmergencyBloc>().emergencies,
          builder: (context, data){
            if(data.hasError){
              showDialog(context: context, builder: (context) => NoNetworkDialog());
              return Column(
                children: [
                  FlatButton(onPressed:  getHistories, child: Text('Retry'))
                ],
              );
            }
            else if(data.connectionState == ConnectionState.waiting){
              return Center(
                  child: CircularProgressIndicator(),
              );
            }
            else{
              final response = data.data;
              return ListView.builder(
                  itemCount: response.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(response[index].username),
                      subtitle: Text(response[index].specificProblem),
                      trailing: response[index].emergencyStatus.toLowerCase() != "untreated" 
                      ? Icon(Icons.check, color: Colors.blue,) : Icon(Icons.check, color: Colors.grey[300],),
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
