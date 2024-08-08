import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:timerapp/ui/timer_page.dart';

import 'bloc/timer_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timer app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Colors.black),
        ),
        home: TimerPage(),
      ),
    );
  }
}
