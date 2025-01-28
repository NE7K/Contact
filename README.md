# Contact Application

Dart 언어로 작성된 연락처 애플리케이션입니다.

<br>

# Study Recode

### context
아래 코드는 context 상위에 어떤 레이아웃이 존재하는지 체크할 수 있다.

예를 들어서, Material > Scaffold (context)인 상황에서는 출력되는 문구는 Material이다.

- context에 대해서 알아야 하는 이유는 ShowDialog와 같은 기능에서 필수적으로 사용되는 때문이다.

```
  print(context.findAncestorWidgetOfExactType<MaterialApp>());
```
아래는 Contact Application 기본적인 레이아웃 틀이다.

### ListView, ListTile
가장 기본이되는 ListView를 아래와 같이 사용할 수 있다.

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

하지만, 아래와 같이 ListTile을 사용해서 간단하게 표현할 수 있다.

> ListTile(
leading: Icon(Icons.account_circle),
title: Text('홍길동')
)

### State

setState은 rendering을 다시 진행시키는 기능을 가지고 있다.

만약에, 부모가 가진 변수를 자식이 똑같은 변수를 사용하고 싶은 경우에는?

```
return DialogUi(people : a);
DialogUi({super.key, this.people });
var people;
``` 

위 처럼 사용하면 자식도 부모가 가진 함수를 이용할 수 있다. (전송, 등록, 사용)

### 🧑‍💻