import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;

  const TextfieldWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF3F1F1),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 20,
            color: Color(0xffC2BDBD),
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
