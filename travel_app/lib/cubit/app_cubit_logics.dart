//this is the file that should hold our states and check our states
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/homepage.dart';
import 'package:travel_app/pages/welcome_page.dart';
import 'package:travel_app/widgets/app_text.dart';

import 'app_cubit_states.dart';
import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          } else if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return Homepage();
          } else if (state is DetailState) {
            return DetailPage();
          } else {
            return Container(
              child: Center(
                child: AppText(
                  text: "the logic has not been implemented",
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
