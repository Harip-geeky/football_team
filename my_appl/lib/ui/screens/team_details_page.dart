import 'package:flutter/material.dart';
import 'package:my_appl/model/team_model.dart';

class TeamDetailPage extends StatelessWidget {
  const TeamDetailPage({super.key, required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(user.name), // title of UserDetail screen
          ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(team.flag),
            ),
            Text(team.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Fifa Code :'),
                Text(team.fifaCode),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Iso2 : '),
                Text(team.iso2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
