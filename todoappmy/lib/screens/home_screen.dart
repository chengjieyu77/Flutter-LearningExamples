import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoappmy/data/data.dart';
import 'package:todoappmy/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:todoappmy/widgets/widgets.dart';
import '../config/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final inCompletedTasks = _incompletedTasks(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                  height: deviceSize.height * 0.3,
                  width: deviceSize.width,
                  color: colors.primary,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () => Helpers.selectDate(context, ref),
                          child: DisplayWhiteText(
                            text: DateFormat.yMMMd().format(selectedDate),
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DisplayWhiteText(
                          text: 'My Todo List',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
              top:
                  context.deviceOrientation == Orientation.portrait ? 150 : 120,
              left: 0,
              right: 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DisplayListOfTasks(tasks: inCompletedTasks),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Completed',
                          style: context.textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DisplayListOfTasks(
                          tasks: completedTasks,
                          isCompletedTasks: true,
                        ),
                      ]),
                ),
              )),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(RouteLocation.createTask);
                    },
                    child: DisplayWhiteText(
                      text: "Add new text",
                      fontSize: 20,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (task.isCompleted && isTaskDay) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }

  List<Task> _incompletedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (!task.isCompleted && isTaskDay) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }
}
