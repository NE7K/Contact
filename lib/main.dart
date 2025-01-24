import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            onPressed: () {
              setState(() {
                a++;
              });
            }
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('연락처')
        ),
        body: ListView.builder(
          itemCount: 300,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('홍길동'),
              trailing: TextButton(onPressed: () {}, child: Text('dfjkld')),
            );
          },
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
