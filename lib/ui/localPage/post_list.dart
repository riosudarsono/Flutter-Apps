import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final String name;
  PostList({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        color: Colors.blue,
        child: Text(name),
      ),
    );
  }
}
