import 'dart:convert';

import 'package:covid_app/Services/app_url.dart';
import 'package:http/http.dart' as http;

import '../Models/world_stats_model.dart';


class StatsServices{

  Future<WorldStatsModel> fetchWorldStatsRecords()async{
      final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return WorldStatsModel.fromJson(data);
      }else{
        throw Exception('Error');
      }
  }
  Future<List<dynamic>> countriesListApi()async{
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    var data;

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }
}
