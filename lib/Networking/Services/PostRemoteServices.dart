import "package:http/http.dart" as http;
import "package:state_management/Networking/Post.dart";

class PostRemoteServices  {
    Future<List<Post>?> getAllPosts() async {
      var client = http.Client();
      var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
      var response = await client.get(url);
      if(response.statusCode == 200){
        var jsonData = response.body;
        return postListFromJson(jsonData);
      }
    }
}