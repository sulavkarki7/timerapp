part of 'timer_bloc.dart';

@immutable
sealed class TimerEvent {}

class StartTimerEvent extends TimerEvent {}

class StopTimerEvent extends TimerEvent {}

class ResetTimerEvent extends TimerEvent {}

class TickEvent extends TimerEvent {
  final int duration;
  TickEvent(this.duration);
}
