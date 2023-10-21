import 'package:best_food_project/loginpart/wecome_page/ordering_working_page.dart';
import 'package:flutter/material.dart';

class EnhancedUserExperiencePage extends StatefulWidget {
  @override
  _EnhancedUserExperiencePageState createState() =>
      _EnhancedUserExperiencePageState();
}

class _EnhancedUserExperiencePageState
    extends State<EnhancedUserExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enhanced User Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to Enhanced User Experience!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Explore categories and item details to enhance your food ordering experience.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Ordering Workflow Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderingWorkflowPage(),
                  ),
                );
              },
              child: Text('Proceed to Ordering Workflow'),
            ),
          ],
        ),
      ),
    );
  }
}
