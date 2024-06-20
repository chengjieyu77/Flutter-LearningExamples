import 'package:flutter/material.dart';

class MyDialog extends Dialog{
  const MyDialog({Key? key}):super(key: key)

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context){
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child:Container(
                height: 300,
                width: 300,
                color: Colors.amber,
      )
      ) ,
    );
  }
}