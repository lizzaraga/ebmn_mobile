import 'package:ebmn_mobile/data/models/GeneralInfoModel.dart';
import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/src/blocs/AuthBloc.dart';
import 'package:ebmn_mobile/src/blocs/PatientBloc.dart';
import 'package:flutter/material.dart';

class GeneralInfoScreen extends StatefulWidget {
  @override
  _GeneralInfoScreenState createState() => _GeneralInfoScreenState();
}

class _GeneralInfoScreenState extends State<GeneralInfoScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('General Informations'),),
      body: StreamBuilder<GeneralInfoModel>(
        stream: getIt.get<PatientBloc>().generalInfoStream,
        builder: (context, asyncData){
          if(asyncData.hasError){
            return Container(
              child: Center(child: RaisedButton(child: Text("An error eccurs ! Try again"), onPressed: (){
                getData();
              },),),
            );
          }
          
          else if(asyncData.hasData) {
            final data = asyncData.data;
            return ListView(
            children: [
                ListTile(
                  title: Text("Username"),
                  subtitle: Text(data.username),
                ),
                ListTile(
                  title: Text("E-mail"),
                  subtitle: Text(data.email),
                ),
                ListTile(
                  title: Text("Phone number"),
                  subtitle: Text(data.phoneNumber),
                ),
                ListTile(
                  title: Text("Title"),
                  subtitle: Text(data.phoneNumber ?? "N/A"),
                ),
                ListTile(
                  title: Text("First name"),
                  subtitle: Text(data.firstName ?? "N/A"),
                ),
                ListTile(
                  title: Text("Last name"),
                  subtitle: Text(data.lastName ?? "N/A"),
                )
              ],
            );
          }
          else return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

  void getData() {
    getIt.get<AuthBloc>().authUser.listen((event) {
      getIt.get<PatientBloc>().getGeneralInfo(event);
    });
  }
}