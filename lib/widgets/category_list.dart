import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/provider/motels.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final categoryList = [
    'Tất cả', 'Hải Châu', 'Cẩm Lệ', 'Ngũ Hành Sơn', 'Liên Chiểu', 'Sơn Trà', 'Hòa Vang', 'Thanh Khuê'
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
              Provider.of<MotelProvider>(context, listen: false).setTargetCategory(categoryList[index]);
            },
            child: Text(
                categoryList[index],
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: currentSelect == index ? FontWeight.bold : FontWeight.normal,
                  color: currentSelect == index ? Colors.blue.shade900 : Colors.grey,
                )
            ),
          ),
          separatorBuilder: (_, index) => const SizedBox(width: 30),
          itemCount: categoryList.length
      ),
    );
  }
}
