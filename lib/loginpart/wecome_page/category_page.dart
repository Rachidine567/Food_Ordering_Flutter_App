import 'package:best_food_project/loginpart/wecome_page/item_details_page.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> categories = [
    'Dishes',
    'langouste',
    'salad',
    'pizza',
    'pilaf'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(Icons.fastfood),
              title: Text(categories[index]),
              onTap: () {
                // Navigate to the Item Details Page for the selected category with Hero animation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsPage(categories[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
