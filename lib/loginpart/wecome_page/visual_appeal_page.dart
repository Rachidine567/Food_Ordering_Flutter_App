import 'package:best_food_project/loginpart/wecome_page/custo_pers_page.dart';
import 'package:flutter/material.dart';

class VisualAppealPage extends StatefulWidget {
  @override
  _VisualAppealPageState createState() => _VisualAppealPageState();
}

class _VisualAppealPageState extends State<VisualAppealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visual Appeal Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to Visual Appeal Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Showcasing images, descriptions, and details in an organized manner.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Customization and Personalization Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomizationAndPersonalizationPage(),
                  ),
                );
              },
              child: Text('Proceed to Customization and Personalization Page'),
            ),
          ],
        ),
      ),
    );
  }
}
