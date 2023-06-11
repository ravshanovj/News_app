import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/home_state.dart';
import 'package:newsapp/view/page.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IsolatePage(),
    );
  }
}
