import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/internet.cubit.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetStatus>(
          listener: (context, state) {
            // show snackbar based on the state
            // listen to the state changes
            // listener is called whenever the state changes
            if (state == InternetStatus.connected) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected',
                      style: TextStyle(color: Colors.white)),
                  duration: Duration(milliseconds: 1000),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetStatus.disconnected) {
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
            if (state == InternetStatus.connected) {
              return const Text('Connected',
                  style: TextStyle(color: Colors.green));
            } else if (state == InternetStatus.disconnected) {
              return const Text('Disconnected',
                  style: TextStyle(color: Colors.red));
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
