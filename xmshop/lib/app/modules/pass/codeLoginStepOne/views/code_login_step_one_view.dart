import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/service/screenAdapter.dart';

import '../controllers/code_login_step_one_controller.dart';
import '../../../../widgets/textfield.dart';
import '../../../../widgets/passButton.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [TextButton(onPressed: () {}, child: Text("'help"))],
        ),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
                padding: EdgeInsets.all(ScreenAdapter.width(40)),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: PassTextField(
                    hintText: "please input phone number",
                    onCanged: (value) {})),
            Passbutton(
                onPressed: () {
                  Get.toNamed('/code-login-step-two');
                },
                text: "Get verified code")
          ],
        ));
  }
}
