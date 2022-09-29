import 'package:flutter/material.dart';
import 'package:flutter_test_1/ui/localPage/post_list.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({super.key});

  @override
  State<LocalPage> createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  // final _myBox = Hive.box('mybox');
  final List post = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    writeData();
                  },
                  child: Text('Write'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    readData();
                  },
                  child: Text('Read'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                return PostList(name: post[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  void writeData() {
    setState(() {
      post.add("Post " + (post.length+1).toString());
    });
    // _myBox.put(1, 'Rio');
    // print(_myBox.get(1));
  }

  void readData() {
    // print(_myBox);
  }

  void deleteData() {}
}
