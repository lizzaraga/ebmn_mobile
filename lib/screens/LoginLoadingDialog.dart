import 'package:ebmn_mobile/main.dart';
import 'package:ebmn_mobile/screens/ClerkScreen.dart';
import 'package:ebmn_mobile/screens/MainScreen.dart';
import 'package:ebmn_mobile/src/blocs/AuthBloc.dart';
import 'package:ebmn_mobile/utils/flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginLoadingDialog extends StatefulWidget{
  @override
  _LoginLoadingDialogState createState() => _LoginLoadingDialogState();
}

class _LoginLoadingDialogState extends State<LoginLoadingDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt.get<AuthBloc>().authLifecycle.listen((event) {
      if(event == TaskLifecycle.done){
        getIt.get<AuthBloc>().jobUser.listen((event) {
           Navigator.of(context).pop();
          if(event.job.toLowerCase() == "patient"){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
          }else
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ClerkScreen()));
        });
      }if(event == TaskLifecycle.error){
        Navigator.of(context).pop();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: (){
        print('Will pop Dialog');
      },
      child: Dialog(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20,),
              Text("Please wait ...", style: Theme.of(context).textTheme.subtitle1,)
            ],
          ),
        ),
      ),
    );
  }
}