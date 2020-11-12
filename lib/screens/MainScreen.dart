import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends HookWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_rounded)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history)
          )
        ],
      ),
    );
  }

}