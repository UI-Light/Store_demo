import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        color: Color(0xffF3F1F1),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Tony',
          hintStyle: TextStyle(
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
