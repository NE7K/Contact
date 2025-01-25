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

  var total = 3; // 사람 총 인원
  var name = ['김영숙', '홍길동', '나구글']; // 사람 이름 저장

  addPerson(a) { // 사람 추가 함수, 매개변수 a
    setState(() {
      total++;
      name.add(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text('버튼'),
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return DialogUi( addPerson: addPerson);
              });
            }
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Contact Appliaction')
        ),
        body: ListView.builder(
          itemCount: name.length, //
          itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i])
            );
          },
        ),

        bottomNavigationBar: bottomIcon()

      );
  }
}

// floating action button event
class DialogUi extends StatelessWidget {
 DialogUi({super.key, this.addPerson});

  final addPerson;
  var inputData = TextEditingController();

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
              Text('연락처 추가'),
              TextField( controller: inputData ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    addPerson(inputData.text);
                    Navigator.pop(context);
                    }, child: Text('완료')),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                    }, child: Text('취소'))
                ],
              )
            ],
          ),
        )
    );
  }
}

// ---------------------------------------------------------------------------------------------------------------------

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