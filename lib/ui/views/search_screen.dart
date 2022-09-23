import 'package:flutter/material.dart';
import 'package:store_demo/models/product.dart';
import 'package:store_demo/ui/shared/product_grid.dart';

class SearchScreen extends StatefulWidget {
  final List<Product> products;
  const SearchScreen({Key? key, required this.products}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> filteredList = [];

  void searchForProduct(String keyword) {
    filteredList.clear();
    if (keyword.length >= 3) {
      widget.products.forEach((element) {
        element.productName.contains(keyword);
        filteredList.add(element);
        setState(() {});
      });
    }
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffF3F4F9),
              ),
              child: TextFormField(
                onChanged: (keyword) {
                  searchForProduct(keyword);
                },
                controller: controller,
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
            SizedBox(height: 10),
            Expanded(
              child: filteredList.isEmpty
                  ? const Center(
                      child: Text("Product not found"),
                    )
                  : GridView.builder(
                      itemCount: filteredList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                      itemBuilder: ((builder, index) =>
                          ProductGrid(product: filteredList[index])),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
