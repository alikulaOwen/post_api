import 'package:flutter/material.dart';
import 'package:post_api/services/http_services.dart';

import '../Models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome>? post;

  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    getPosts();
  }
  getPosts() async{
    post = await HttpServices().getPosts();
    if (post != null){

      setState((){
        isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Post"),
        backgroundColor: Colors.white30,
      ),
      body: Center(
        child: Visibility(
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
              itemCount: post?.length,
              itemBuilder: (context, index){
                return Container(
                  // height: ,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black26,
                      style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(13)
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    color: Colors.white30,
                    shadowColor: Colors.black26,
                    elevation: 5,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post![index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(

                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontSize: 22
                        ),),
                        Text(post![index].body ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Roboto'
                        ),)
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
