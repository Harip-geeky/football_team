// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


class TeamModel {
  List<Team> teams;

  TeamModel({
    required this.teams,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        teams: List<Team>.from(json["Teams"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Teams": List<dynamic>.from(teams.map((x) => x.toJson())),
      };
}

class Team {
  int id;
  String name;
  String fifaCode;
  String iso2;
  String flag;
  String emoji;
  String emojiString;

  Team({
    required this.id,
    required this.name,
    required this.fifaCode,
    required this.iso2,
    required this.flag,
    required this.emoji,
    required this.emojiString,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        fifaCode: json["fifaCode"],
        iso2: json["iso2"],
        flag: json["flag"],
        emoji: json["emoji"],
        emojiString: json["emojiString"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fifaCode": fifaCode,
        "iso2": iso2,
        "flag": flag,
        "emoji": emoji,
        "emojiString": emojiString,
      };
}
