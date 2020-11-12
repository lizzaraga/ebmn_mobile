import 'package:ebmn_mobile/screens/mainScreenChildren/EmergencyScreen.dart';
import 'package:ebmn_mobile/screens/mainScreenChildren/HistoryScreen.dart';
import 'package:ebmn_mobile/screens/mainScreenChildren/PatientScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final _pageIndexProvider = StateProvider((_) => 1);

class MainScreen extends HookWidget{
  final List<HookWidget> pages = [
    PatientScreen(), EmergencyScreen(),
    HistoryScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HookBuilder(
        builder: (context){
          final pageIndex = useProvider(_pageIndexProvider).state;
          return pages[pageIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          context.read(_pageIndexProvider).state = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            activeIcon: Icon(Icons.notification_important, color: Colors.redAccent,)

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history)
          )
        ],
      ),
    );
  }

}