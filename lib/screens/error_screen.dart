import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'We couldn\'t find that page!',
              style: TextStyle(
                fontSize: 50,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
