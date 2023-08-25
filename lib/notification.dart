import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Notifications',style: TextStyle(color: Color( 0xffF81B1B),fontSize: 25),
        ),
       backgroundColor:const Color(0xfff5f5f5), 
      ),
    );
  }
}