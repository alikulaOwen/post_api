import 'package:http/http.dart' as http;


import 'package:post_api/Models/post.dart';

class HttpServices{
 Future<List<Welcome>?> getPosts() async {
   var client = http.Client();

   var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

   var response = await client.get(url);

   if (response.statusCode == 200) {
     var json = response.body;
     return welcomeFromJson(json);
   }
   return null;
 }
}