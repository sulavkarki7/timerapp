import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<StartTimerEvent>(_onStartTimerEvent);
    on<StopTimerEvent>(_onStopTimerEvent);
    on<ResetTimerEvent>(_onResetTimerEvent);
    on<TickEvent>(_onTickEvent);
  }

  Timer? _timer;

  FutureOr<void> _onStartTimerEvent(
      StartTimerEvent event, Emitter<TimerState> emit) {
    emit(TimerLoading());
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer) {
      add(TickEvent(
          state is TimerLoaded ? (state as TimerLoaded).duration + 1 : 0));
    });
  }

  FutureOr<void> _onStopTimerEvent(
      StopTimerEvent event, Emitter<TimerState> emit) {
    _timer?.cancel();
    if (state is TimerLoaded) {
      emit(TimerLoaded(duration: (state as TimerLoaded).duration));
    }
  }

  FutureOr<void> _onResetTimerEvent(
      ResetTimerEvent event, Emitter<TimerState> emit) {
    _timer?.cancel();
    emit(TimerLoaded(duration: 0));
  }

  FutureOr<void> _onTickEvent(TickEvent event, Emitter<TimerState> emit) {
    emit(TimerLoaded(duration: event.duration));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
