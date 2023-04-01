import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/PostsModel.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<PostsModel> postlist = [];
  Future<List<PostsModel>> getPostApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        postlist.add(PostsModel.fromJson(i));
      }
      return postlist;
    }
    else{
      return postlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
                builder: (context , snapshot){
                if(!snapshot.hasData){
                  postlist.clear();
                  return Center(child:Text("Loading.....", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),));
                }else{
                  return ListView.builder(
                    itemCount: postlist.length,
                      itemBuilder: (context , index){
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title :"+postlist[index].title.toString(),style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("Description :"+postlist[index].body.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  });

                }
            }),
          )
        ],
      ),
    );
  }
}
