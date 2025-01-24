# 연락처

list view 공부용

## 메모

``` dart

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


```

> list view는 이런 방식으로 작성 가능하고 listtile 사용가능
>>>ListTile(
leading: Icon(Icons.account_circle),
title: Text('홍길동')
)