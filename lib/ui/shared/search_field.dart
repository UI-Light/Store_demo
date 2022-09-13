import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 14,
          width: MediaQuery.of(context).size.width / 1.4,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffF3F4F9),
          ),
          child: TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: const InputDecoration(
              hintText: 'Search for fruit salad combos',
              hintStyle: TextStyle(
                fontSize: 15,
                color: Color(0xff86869E),
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Color(0xff86869E)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune),
            color: const Color(0xff070648),
          ),
        )
      ],
    );
  }
}
