import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;

  const CustomInput({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 14, color: Color(0xffbcd8ec)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: Color(0xff8dbde0),
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 18,
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 50)),
      style: TextStyle(fontSize: 15, color: Colors.white),
    );
  }
}
