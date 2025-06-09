import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/ListProvider.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, NumberListProvider nlp, Widget? child)=>
    Scaffold(
      appBar: AppBar(title: Text('SECOND SCREEN')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //last +1
          //add to number
          nlp.add();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text(
            nlp.number.last.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nlp.number.length,
              itemBuilder:
                  (context, index) => Text(
                    nlp.number[index].toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
            ),
          ),
        ],
      ),
    ));
  }
}