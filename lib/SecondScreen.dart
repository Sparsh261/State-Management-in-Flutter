import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final List<int> number;
  SecondScreen({required this.number});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SECOND SCREEN')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //last +1
          //add to number
          setState(() {
            widget.number.add(widget.number.last + 1);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text(
            widget.number.last.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.number.length,
              itemBuilder:
                  (context, index) => Text(
                    widget.number[index].toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}