import 'package:flutter/material.dart';

class CustomizationAndPersonalizationPage extends StatefulWidget {
  @override
  _CustomizationAndPersonalizationPageState createState() =>
      _CustomizationAndPersonalizationPageState();
}

class _CustomizationAndPersonalizationPageState
    extends State<CustomizationAndPersonalizationPage> {
  // Example customization options
  bool addToppings = false;
  bool selectPortionSize = false;
  String selectedSize = 'Regular';

  // Example toppings
  List<String> availableToppings = [
    'Cheese',
    'Pepperoni',
    'Mushrooms',
    'Onions'
  ];
  List<String> selectedToppings = [];

  // Example portion sizes
  List<String> availableSizes = ['Regular', 'Large', 'Extra Large'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customization and Personalization Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize and Personalize Your Order',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Select Toppings:',
              style: TextStyle(fontSize: 18),
            ),
            Wrap(
              spacing: 8.0,
              children: availableToppings.map((topping) {
                return FilterChip(
                  label: Text(topping),
                  selected: selectedToppings.contains(topping),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedToppings.add(topping);
                      } else {
                        selectedToppings.remove(topping);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Select Portion Size:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              value: selectedSize,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSize = newValue!;
                });
              },
              items: availableSizes.map((size) {
                return DropdownMenuItem<String>(
                  value: size,
                  child: Text(size),
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform actions based on customization and personalization options
                // For example, you can add the selected toppings and portion size to the order
                // and navigate to the next page or perform other actions.
              },
              child: Text('Add to Order'),
            ),
          ],
        ),
      ),
    );
  }
}
