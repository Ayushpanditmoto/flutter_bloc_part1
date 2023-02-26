import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/Screen/cubit_screen.dart';

import '../blocs/internet_blocs/internet.bloc.dart';
import '../blocs/internet_blocs/internet.state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CubitScreen()));
              },
              child: const Text('Cubit'),
            ),
            BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                // show snackbar based on the state
                // listen to the state changes
                // listener is called whenever the state changes
                if (state is InternetConnectedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Internet Connected',
                          style: TextStyle(color: Colors.white)),
                      duration: Duration(milliseconds: 1000),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is InternetDisconnectedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Internet Disconnected',
                          style: TextStyle(color: Colors.white)),
                      duration: Duration(milliseconds: 1000),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                //show different widgets based on the state
                //is or ==
                // is is used to check the type of an object
                // == is used to check the value of an object
                if (state is InternetConnectedState) {
                  return const Text('Connected',
                      style: TextStyle(color: Colors.green));
                } else if (state is InternetDisconnectedState) {
                  return const Text('Disconnected',
                      style: TextStyle(color: Colors.red));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
