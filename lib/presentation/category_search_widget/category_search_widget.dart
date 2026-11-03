import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/screens/event_item/event_item.dart';
import 'package:ticketsystem/widget/category_card/category_search_card.dart';
import '../../global/global.dart';

class CategorySearchWidget extends StatelessWidget {
  
  final List<CategoryModel> categoryList;
  final Function selectedCategory;
  const CategorySearchWidget({
    super.key, 
    required this.categoryList,
    required this.selectedCategory
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        alignment: WrapAlignment.start,
        children: List.generate(categoryList.length, (index) {
        CategoryModel data = categoryList[index];
          return GestureDetector(
            onTap: () {
                categoryListIdEvenItem.clear();
                categoryListIdEvenItem.add(data.id);
                selectedCategory(data);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventItem(),
                ),
              );
            },
            child: FractionallySizedBox(
              alignment: Alignment.center,
                widthFactor: 0.3,
                child:  CategorySearchCard(data: data)),
          );
        }),
      ),
    );
  }
}