import 'package:ebmn_mobile/data/models/LegalDocumentModel.dart';
import 'package:ebmn_mobile/src/blocs/AuthBloc.dart';
import 'package:ebmn_mobile/src/blocs/PatientBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../main.dart';

class LegalDocumentScreen extends HookWidget{
  @override
  Widget build(BuildContext context) {
    useEffect((){
      getData();
    }, []);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Legal documents'),),
      body: StreamBuilder<List<LegalDocumentModel>>(
        stream: getIt.get<PatientBloc>().legalDocumentsStream,
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
            if(data.isEmpty) return Center(
              child: Text("No items", style: Theme.of(context).textTheme.headline6,),
            );
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index){
                final document = data[index];
                return Card(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text("Category"),
                            Text(document.category)
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text("Decision date"),
                            Text(document.decisionDate)
                          ],
                        ),
                      )
                    ],
                  )
                );
              },
            );
          }
          else return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
  
  void getData() {
    getIt.get<AuthBloc>().authUser.listen((event) {
      getIt.get<PatientBloc>().getLegalDocuments(event);
    });
  }
}