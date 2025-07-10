import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'catapi.dart';






class apicls extends StatefulWidget {
  const apicls({super.key});

  @override
  State<apicls> createState() => _apiclsState();
}

class _apiclsState extends State<apicls> {


  Map<String,dynamic> bodyData={};
  Future<Catclass> getData() async{
    try {
      var apiResponse = await http.get(Uri.parse("https://api.agify.io/?name=meelad"));

      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        bodyData = jsonDecode(apiResponse.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Data fetched successfully")));
        return Catclass.fromJson(bodyData);
      }
      else {
        throw Exception(apiResponse.body);
      }
    }
    catch(e){
      throw Exception(e);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catfact Api"),
      ),
      body: FutureBuilder(future:getData() , builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        else if(snapshot.hasError){
          return Text("Error :${snapshot.error}");
        }
        else if(snapshot.hasData){
          var myData=snapshot.data!;

          return Column(
            children: [
              Text(bodyData["count"].toString()),
              Text(bodyData["name"]),
              Text(bodyData["age"].toString()),

            ],
          );
        }
        else{
          return Text("No data found");
        }
      }),
    );
  }
}



class Apiclass {
  int? count;
  String? name;
  int? age;

  Apiclass({this.count, this.name, this.age});

  Apiclass.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}