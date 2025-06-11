import 'package:flutter/material.dart';
import 'package:state_management/Networking/Post.dart';
import 'package:state_management/Networking/PostCard.dart';
import 'package:state_management/Networking/Services/PostRemoteServices.dart';


class PostScreen extends StatefulWidget{
  const PostScreen({super.key});


  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  List<Post>? allPosts=[];
  bool isLoaded = false;

  void initState(){
    super.initState();
    getData();
  }

  void getData() async {
     allPosts = await PostRemoteServices().getAllPosts();
      print("2");
    if(allPosts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts"),),
      body: Visibility(
        replacement: CircularProgressIndicator() ,
        visible: isLoaded ,
        child: ListView.builder(
          itemCount: allPosts!.length ,
          itemBuilder: (context,index) => PostCard(photo : allPosts![index]))),
    );
  }
}