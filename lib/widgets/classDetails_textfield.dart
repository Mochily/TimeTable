import 'package:flutter/material.dart';
import 'package:mochily_timetable/setting/setting_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClassDetailsTextField extends ConsumerStatefulWidget {
  final String name;
  final IconData some_icon;
  final StateController textProvider;
  final String someText;

  ClassDetailsTextField({
    Key? key,
    required this.name,
    required this.some_icon,
    required this.textProvider,
    required this.someText,
  });
  @override
  ClassDetailsTextFieldState createState() => ClassDetailsTextFieldState();
}

class ClassDetailsTextFieldState extends ConsumerState<ClassDetailsTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3, right: 10),
      height: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorList.shadow,
            offset: Offset(3.0, 4.0),
            blurRadius: 4.0,
          )
        ],
      ),
      child: showText(),
    );
  }

  TextFormField showText() {
    return TextFormField(
      initialValue: widget.someText,
      onChanged: (value) {
        widget.textProvider.state = value;
      },
      decoration: InputDecoration(
        hintText: widget.name,
        prefixIcon: Icon(
          widget.some_icon,
          size: 35,
        ),
        /*
        suffixIcon: IconButton(
          onPressed: () {},

          icon: Icon(
            Icons.clear,
            size: 35,
          ),
        ),
         */
        hintStyle: const TextStyle(
          fontSize: 20,
        ),
        filled: true,
        fillColor: ColorList.white,
        border: InputBorder.none,
      ),
    );
  }
}
