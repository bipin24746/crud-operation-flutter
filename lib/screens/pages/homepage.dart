import 'package:crud/screens/containers/addbutton.dart';
import 'package:crud/screens/pages/readdata.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Readdata(),
      floatingActionButton: AddButton(),
    );
  }
}
