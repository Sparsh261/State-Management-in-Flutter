import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationFlutter extends StatefulWidget {
  @override
  State<AnimationFlutter> createState() => _AnimationFlutterState();
}

class _AnimationFlutterState extends State<AnimationFlutter> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body: Center(
        child: InkWell(
          onTap: (){setState(() {
            isExpanded = !isExpanded;
          });},
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: isExpanded ? 250 : 80,
            height: isExpanded ? 200 : 60,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isExpanded ? Icons.check : Icons.shopping_cart),
                if(isExpanded) Text("Added to cart"),
              ],
            ),
            decoration: BoxDecoration(
              color: isExpanded ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.circular(isExpanded ? 100 :20)
              ),
              ),
        ),
      ),
    );
  }
}