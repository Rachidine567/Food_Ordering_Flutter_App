import 'package:best_food_project/loginpart/wecome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  'images/profile1.jpg'), // Replace with the user's profile picture
            ),
            SizedBox(height: 16.0),
            Text(
              'User name', // Replace with the user's name
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'jemba.doe@example.com', // Replace with the user's email
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0),
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.edit),
              onTap: () {
                // Navigate to the edit profile page
                // Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            ListTile(
              title: Text('Change Password'),
              leading: Icon(Icons.lock),
              onTap: () {
                // Navigate to the change password page
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Implement sign-out logic here
                // For example, if using Firebase Authentication:
                // FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context,
                    ' WelcomePage'); // Navigate to the authentication page
              },
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
