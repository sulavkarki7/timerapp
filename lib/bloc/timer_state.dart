part of 'timer_bloc.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

class TimerLoading extends TimerState {}

class TimerLoaded extends TimerState {
  final int duration;

  TimerLoaded({required this.duration});
}

class TimerError extends TimerState {
  final String message;
  TimerError(this.message);
}
