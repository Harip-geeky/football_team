import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_appl/blocs/team_bloc/team_event.dart';
import 'package:my_appl/blocs/team_bloc/team_state.dart';
import 'package:my_appl/repositories/team_repository.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamRepository _teamRepository;

  TeamBloc(this._teamRepository) : super(TeamLoadingState()) {
    on<LoadTeamEvent>((event, emit) async {
      emit(TeamLoadingState());
      try {
        final teams = await _teamRepository.getTeams();
        emit(TeamLoadedState(teams));
      } catch (e) {
        emit(TeamErrorState(e.toString()));
      }
    });
  }
}
