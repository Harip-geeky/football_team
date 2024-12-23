import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/team_model.dart';

class TeamRepository {
  String baseUrl = 'https://myfakeapi.com/api/football/teams';
  Future<List<Team>> getTeams() async {
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['Teams'];
      return result.map((e) => Team.fromJson(e)).toList();
    } else
      throw Exception(response.reasonPhrase);
  }
}
