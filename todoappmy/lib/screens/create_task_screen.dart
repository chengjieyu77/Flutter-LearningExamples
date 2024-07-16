import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoappmy/data/data.dart';
import 'package:todoappmy/providers/date_provider.dart';
import 'package:todoappmy/utils/app_alerts.dart';
import 'package:todoappmy/utils/utils.dart';

import 'package:todoappmy/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/routes/routes.dart';
import '../providers/providers.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Create New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CommonTextField(
                controller: _titleController,
                inputType: TextInputType.text,
                text: 'task title',
                hintText: 'task title',
              ),
              const SelectCategory(),
              const SelectDateTime(),
              CommonTextField(
                  controller: _noteController,
                  inputType: TextInputType.text,
                  text: 'Notes',
                  hintText: 'Notes',
                  maxLines: 6),
              Container(
                width: context.deviceSize.width,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                    onPressed: () {
                      _createTask();
                    },
                    child: DisplayWhiteText(text: "Save")),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
          title: title,
          note: note,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          category: category,
          isCompleted: false);

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackBar(context, "Add a new task!");
        context.go(RouteLocation.home);
      });
    }
  }
}
