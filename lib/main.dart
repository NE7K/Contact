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

  getPermission() async { // get permission
    var status = await Permission.contacts.status;
    // await는 다음줄로 넘어가려는 Dart 언어의 특성을 제한하는 기능을 가짐
    if (status.isGranted) { // permission 허락 받았을 때
      print('허락됨'); // 출력
      List<Contact> contacts = await FlutterContacts.getContacts(); // Bring Data = get all Data

      setState(() {
        name = contacts; // 가져온 데이터 name에 저장
      });

    } else if (status.isDenied) { // permission 허락 못 받았을 때
      print('거절됨');
      Permission.contacts.request();
    }
  }

  @override
  void initState() { // Appliaction running event
    super.initState();
    getPermission();
    // openAppSettings(); < 앱 설정 띄우기
  }

  var name = []; // 사람 이름 저장
  // List<contacts>를 Dynamic으로 변경해서 타입 오류 방지 but, dynamic = 부하 증가

  addPerson(contact) { // 사람 추가 함수, 매개변수 a
    setState( () {
      name.add(contact);
    });
  }

  var inputData = TextEditingController(); // user text 감시

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(context: context, builder: (context) { // Dialog
                return DialogUi( addPerson: addPerson, inputData: inputData ); // addPerson 함수 DialogUi 위젯으로 사용권한 이전
              });
            }
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Contact Application Example'),
          actions: [ IconButton(onPressed: () { getPermission(); }, icon: Icon(Icons.add))],
          // permission denied = restart action buttton
        ),
        body: ListView.builder(
          itemCount: name.length, // 연락처 개수에 따라 변동
          itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i].displayName) // 연락처의 displayname 부분만 카피
            );
          },
        ),

        bottomNavigationBar: bottomIcon() // bottom widget

      );
  }
}

// floating action button event
class DialogUi extends StatelessWidget {
 DialogUi({super.key, this.addPerson, this.inputData});

 final addPerson;
 final inputData;

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
              Text('이름을 입력해주세요'),
              TextField( controller: inputData ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {

                    // Insert new contact
                    final newContact = Contact();
                    newContact.name.first = inputData.text;
                    newContact.displayName = inputData.text;
                    newContact.insert();
                    addPerson(newContact);

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