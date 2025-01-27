import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

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

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      List<Contact> contacts = await FlutterContacts.getContacts();

      setState(() {
        name = contacts;
      });

    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
    // openAppSettings(); 앱 설정 띄우기
  }

  var total = 3; // 사람 총 인원
  var name = []; // 사람 이름 저장

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
          title: Text('Contact Appliaction'),
          actions: [ IconButton(onPressed: () { getPermission(); }, icon: Icon(Icons.add))],
        ),
        body: ListView.builder(
          itemCount: name.length, //
          itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i].displayName)
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