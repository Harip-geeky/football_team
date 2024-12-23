import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/team_model.dart';

@immutable
abstract class TeamState extends Equatable {}

class TeamLoadingState extends TeamState {
  @override
  List<Object?> get props => [];
}

class TeamLoadedState extends TeamState {
  final List<Team> teams;
  TeamLoadedState(this.teams);
  @override
  List<Object?> get props => [teams];
}

class TeamErrorState extends TeamState {
  final String error;
  TeamErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
