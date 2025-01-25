import 'package:flutter/material.dart';

// run - MateialApp content
void main() {
  runApp( MaterialApp (
      home: MyApp()
  ));
}

// state
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['김영숙', '홍길동', '나구글'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return DialogUi(people: a);
              });
            }
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('연락처')
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Text(like[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(onPressed: () {
                setState(() {
                  like[i]++;
                });
              }, child: Text('좋아요'))
            );
          },
        ),

        bottomNavigationBar: bottomIcon()

      );
  }
}

// 하단 navigator appbar
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

// floating action button event
class DialogUi extends StatelessWidget {
  DialogUi({super.key, this.people });

  var people;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
          width: 300,
          height: 200,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Contact'),
              Text(people.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('cancel'))
                ],
              )
            ],
          ),
        )
    );
  }
}
