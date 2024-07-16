import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoappmy/providers/providers.dart';
import 'package:todoappmy/widgets/common_text_field.dart';
import 'package:todoappmy/widgets/form_title.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../utils/helpers.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            inputType: TextInputType.datetime,
            text: 'Date',
            hintText: DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
              icon: FaIcon(FontAwesomeIcons.calendar),
              onPressed: () {
                Helpers.selectDate(context, ref);
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: CommonTextField(
              readOnly: true,
              inputType: TextInputType.datetime,
              text: 'Time',
              hintText: Helpers.timeToString(time),
              suffixIcon: IconButton(
                icon: FaIcon(FontAwesomeIcons.clock),
                onPressed: () {
                  _selectTime(context, ref);
                },
              )),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
