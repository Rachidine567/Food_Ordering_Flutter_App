import 'package:flutter/material.dart';
import 'visual_appeal_page.dart';

class OrderingWorkflowPage extends StatefulWidget {
  @override
  _OrderingWorkflowPageState createState() => _OrderingWorkflowPageState();
}

class _OrderingWorkflowPageState extends State<OrderingWorkflowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordering Workflow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to Ordering Workflow!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Follow the steps to place your order:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            // Add steps or details related to the ordering workflow
            Text(
              'Step 1: Select Category',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'Step 2: Explore Item Details',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'Step 3: Customize Options',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'Step 4: Add to Cart',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              'Step 5: Place Order',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Visual Appeal Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VisualAppealPage(),
                  ),
                );
              },
              child: Text('Proceed to Visual Appeal Page'),
            ),
          ],
        ),
      ),
    );
  }
}
