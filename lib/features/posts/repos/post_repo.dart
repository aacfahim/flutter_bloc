import 'dart:convert';

import 'package:techsell_bloc/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostModel>> fetchPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";

    var client = http.Client();
    List<PostModel> posts = [];

    try {
      var response = await client.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var i in data) {
          posts.add(PostModel.fromJson(i));
        }
        return posts;
      }
    } catch (e) {
      client.close();
      print(e.toString());
      //return posts;
    }

    return posts;
  }
}
