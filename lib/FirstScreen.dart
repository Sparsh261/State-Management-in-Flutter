import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/ListProvider.dart';
import 'package:state_management/SecondScreen.dart';

class FirstScreen extends StatefulWidget {

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:(BuildContext context, NumberListProvider nlp, Widget? child)=>
    Scaffold(
      appBar: AppBar(title: Text("First Screen"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        nlp.add();
      },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(nlp.number[nlp.number.length-1].toString(), style: TextStyle(fontSize: 30),),
          Expanded(
            child: ListView.builder(
              itemCount: nlp.number.length ,
              itemBuilder: (context,index)=>Text(nlp.number[index].toString())
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SecondScreen()));
          }, child: Text("Navigate"))
        ],
      ),
    ));
  }
}