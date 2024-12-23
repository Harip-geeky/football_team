import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TeamEvent extends Equatable {
  const TeamEvent();
}

class LoadTeamEvent extends TeamEvent {
  @override
  List<Object?> get props => [];
}
