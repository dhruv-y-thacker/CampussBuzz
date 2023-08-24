import 'package:flutter/material.dart';

class previewScreen extends StatefulWidget {
  const previewScreen({super.key});

  @override
  State<previewScreen> createState() => _previewScreenState();
}

class _previewScreenState extends State<previewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' YOU WON THE \$75,000 CASH \n PRIZE  CONGRATULATIONS \n CAMPUSBUZZ  TEAM',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add any other UI components you want here
          ],
        ),
      ),
    );
  }
}
