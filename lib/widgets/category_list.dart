import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final categoryList = [
    'Trend', 'Recommend', 'Top search', 'Featured', 'New'
  ];
  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                currentSelect = index;
              });
            },
            child: Text(
                categoryList[index],
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: currentSelect == index ? FontWeight.bold : FontWeight.normal,
                  color: currentSelect == index ? Theme.of(context).colorScheme.secondary : Colors.grey,
                )
            ),
          ),
          separatorBuilder: (_, index) => const SizedBox(width: 30),
          itemCount: categoryList.length
      ),
    );
  }
}
