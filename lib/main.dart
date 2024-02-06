import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserDetailsPage(),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> saveUserDetails() async {
    final String name = nameController.text;
    final String phoneNumber = phoneNumberController.text;

    final String apiUrl = 'https://adc.bitsathy.ac.in/projects/e_vehicle_2024/api/test.php'; // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'User_name': name,
        'Mobile_no': phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      print('User details saved successfully!');
      // You can add further actions here if needed
    } else {
      print('Failed to save user details. Status code: ${response.statusCode}');
      // Handle errors accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveUserDetails,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
