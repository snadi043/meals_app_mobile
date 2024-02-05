import 'package:flutter/material.dart';

class Catergory extends StatelessWidget {
  const Catergory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your Category')),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: const [
          Text(
            '1',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '2',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            '4',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
