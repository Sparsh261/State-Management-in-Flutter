import 'package:flutter/material.dart';
import 'package:state_management/SecondScreen.dart';

class FirstScreen extends StatefulWidget {

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<int> number = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          number.add(number.last+1);
        });
      },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number[number.length-1].toString(), style: TextStyle(fontSize: 30),),
          Expanded(
            child: ListView.builder(
              itemCount: number.length,
              itemBuilder: (context,index)=>Text(number[index].toString())
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SecondScreen(number: number)));
          }, child: Text("Navigate"))
        ],
      ),
    );
  }
}