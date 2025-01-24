import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('연락처')
        ),
        body: ListView(
         children: [
           Row(
             children: [
               Icon(Icons.account_circle),
               Text('홍길동'),
             ],
           ),
           Row(
             children: [
               Icon(Icons.account_circle),
               Text('홍길동'),
             ],
           ),
           Row(
             children: [
               Icon(Icons.account_circle),
               Text('홍길동'),
             ],
           )
         ],
        ),

        bottomNavigationBar: bottomIcon()

      ),
    );
  }
}

class bottomIcon extends StatelessWidget {
  const bottomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message)),
              IconButton(onPressed: () {}, icon: Icon(Icons.contact_page))
            ]
        )

    );
  }
}
