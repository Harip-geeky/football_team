import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_appl/blocs/team_bloc/team_bloc.dart';
import 'package:my_appl/blocs/team_bloc/team_state.dart';
import 'package:my_appl/model/team_model.dart';
import 'package:my_appl/repositories/team_repository.dart';
import 'package:my_appl/ui/screens/team_details_page.dart';

import '../../blocs/team_bloc/team_event.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TeamBloc>(
          create: (BuildContext context) => TeamBloc(TeamRepository()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(title: const Text('GeekyWolf Test')),
          body: blocBody()),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => TeamBloc(
        TeamRepository(),
      )..add(LoadTeamEvent()),
      child: BlocBuilder<TeamBloc, TeamState>(
        builder: (context, state) {
          if (state is TeamLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TeamErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is TeamLoadedState) {
            List<Team> teamList = state.teams;
            return ListView.builder(
                itemCount: teamList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TeamDetailPage(team: teamList[index]),
                          ),
                        );
                      },
                      child: Card(
                          child: ListTile(
                              title: Text(
                                teamList[index].name,
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(teamList[index].flag),
                              ))),
                    ),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
