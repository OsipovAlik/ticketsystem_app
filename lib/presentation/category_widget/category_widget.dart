import 'package:flutter/material.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/widget/category_card/category_card.dart';



class CategoryWidget extends StatelessWidget {
  final Function getCategory;
  final List<CategoryModel> categoryList;
const CategoryWidget({ super.key,required this.getCategory, required this.categoryList });

  @override
  Widget build(BuildContext context){
    return Container(
                margin: const EdgeInsets.only(top: 16.0,left: 16.0),
                // color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ListView.builder(
                  itemCount: categoryList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemBuilder: (BuildContext context,int idx){
                    CategoryModel data = categoryList[idx];
                      return GestureDetector(
                        onTap: (){
                          if(data.isActive){
                             categoryListIdEvenItem.clear();
                             getCategory(context,data);
                          }else{
                            categoryListIdEvenItem.clear();
                            categoryListIdEvenItem.add(data.id);
                            getCategory(context,data);
                          }
                        },
                        child: CategoryCard(data:data)
                      );
                }),
              );
  }
}