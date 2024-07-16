import 'dart:convert';

import 'package:covi19tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/WorldStatesModel.dart';


class StateServices{
  Future<WorldStatesModel> fatchWordlStateRecord () async{
    
    final response=await http.get(Uri.parse(Url.WorldStateApi));

    if(response.statusCode == 200){
      var data=jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi () async{
    var data;
    final response=await http.get(Uri.parse(Url.CountryLIst));
    if(response.statusCode == 200){
      data=jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }
}


