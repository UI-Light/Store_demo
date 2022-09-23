import 'package:flutter/material.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/ui/views/search_screen.dart';

class SearchField extends StatefulWidget {
  final List<Product> products;
  const SearchField({Key? key, required this.products}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();

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
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreen(
                        products: widget.products,
                      )));
            },
            controller: searchController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: const InputDecoration(
              hintText: 'Search for products',
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
