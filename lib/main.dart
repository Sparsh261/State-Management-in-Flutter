import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/FirstScreen.dart';
import 'package:state_management/ListProvider.dart';

void main() {
  // runApp(MaterialApp(home: FirstScreen(),));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>NumberListProvider())
    ],
    child: MaterialApp(home: FirstScreen(),),
  ));
}

