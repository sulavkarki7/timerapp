import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:timerapp/bloc/timer_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        foregroundColor: Color.fromARGB(255, 3, 3, 141),
        backgroundColor: Colors.pink[50],
        title: const Text(
          'Timer app',
        ),
        titleTextStyle: TextStyle(fontSize: 18),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TimerBloc, TimerState>(builder: (context, state) {
              if (state is TimerInitial) {
                return const Text('Press start to begin');
              } else if (state is TimerLoading) {
                return const CircularProgressIndicator();
              } else if (state is TimerLoaded) {
                final minutes =
                    (state.duration ~/ 60).toString().padLeft(2, '0');
                final seconds =
                    (state.duration % 60).toString().padLeft(2, '0');
                return Text(
                  '$minutes:$seconds',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 3, 3, 141),
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                );
              } else if (state is TimerError) {
                return Text(state.message);
              }
              return Container();
            }),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[50],
                    ),
                    onPressed: () {
                      log('start vayoo');

                      context.read<TimerBloc>().add(StartTimerEvent());
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 3, 141),
                      ),
                    )),
                SizedBox(
                  width: Get.width * 0.025,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[50],
                  ),
                  onPressed: () {
                    log('stopped hai ta ');
                    context.read<TimerBloc>().add(StopTimerEvent());
                  },
                  child: const Text(
                    'Stop',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 3, 141),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.025,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[50],
                  ),
                  onPressed: () {
                    log('Firse Chalu Karoo');
                    context.read<TimerBloc>().add(ResetTimerEvent());
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 3, 141),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
