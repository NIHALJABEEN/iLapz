import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:dio/dio.dart';
import 'package:ilapz_test/db/user_database.dart';
import 'package:ilapz_test/models/user.dart';

import 'Constants.dart';

class Datasource{
  Dio dio = Dio();

  Future<Null> fetchDataFromApi() async{

    final responseData = await http.get("https://www.mocky.io/v2/5d565297300000680030a986");

    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      for(Map i in data){
        //listModel.add(User.fromJson(i));
        final user=UsersList(
          id: User.fromJson(i).id,
          name: User.fromJson(i).name,
          username: User.fromJson(i).username,
          email: User.fromJson(i).email,
          profile_image: User.fromJson(i).profile_image,
          phone: User.fromJson(i).phone,
          website: User.fromJson(i).website,
          address: jsonEncode(User.fromJson(i).address),
          company: jsonEncode(User.fromJson(i).company),
        );
        UserDatabase.instance.create(user);

      }



    }





  }



}