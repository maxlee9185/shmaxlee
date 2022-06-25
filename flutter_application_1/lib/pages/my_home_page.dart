import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('성현이의 Flutter 연습'),
        ),
        body: Column(children: [
          ElevatedButton(
              onPressed: () {
                print('elevatedButton');
              },
              child: const Text('ElevatedButton')),
          OutlinedButton(
              onPressed: () {
                print('outlinedButton');
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text('OutlinedButton')),
          TextButton(
              onPressed: () {
                print('TextButton');
              },
              child: const Text('TextButton')),
          GestureDetector(
            onTap: () {
              print('GestureDetector');
            },
            child: const Text('GestureDectator'),
          )
        ]));
    //   appBar: AppBar(title: const Text('연습중')),
    //   body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //     Container(
    //         color: Colors.red,
    //         alignment: Alignment.center,
    //         width: 100,
    //         height: 100,
    //         child: const Text('나는성현')),
    //     Container(
    //         color: Colors.yellow,
    //         alignment: Alignment.center,
    //         width: 100,
    //         height: 100,
    //         child: const Text('나는성현')),
    //     Container(
    //         color: Colors.green,
    //         alignment: Alignment.center,
    //         width: 100,
    //         height: 100,
    //         child: const Text('나는 성현')),
    //   ]),
    // );
  }
}
