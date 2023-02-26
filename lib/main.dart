import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/cubit/internet.cubit.dart';

import 'Screen/home.screen.dart';
import 'blocs/internet_blocs/internet.bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetBloc(),
        ),
        BlocProvider(
          create: (context) => InternetCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Bloc',
        home: HomeScreen(),
      ),
    );
  }
}
