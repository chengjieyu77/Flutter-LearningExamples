import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'MyFakeData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'My First Application',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'PlaywritePL',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('A random idea:'),
              Text(pair.asLowerCase),
              MyButton(),
              MyPicture(),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  children: initListData(),
                ),
              ),
              Container(
                height: 400,
                color: Colors.amber,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: initListData(),
                ),
              ),
              CustomizedIcon(Icons.home, color: Colors.cyan),
              StackAndPositionExample(),
              MyWrapButton("For Wrap", onPressed: () {
                print("pressed");
              }),
              WrapSample()
            ],
          ),
        ));
  }
}

class StackAndPositionExample extends StatelessWidget {
  const StackAndPositionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.black26,
            ),
          ),
          ListView(
            children: initListData(),
          ),
          Positioned(
            top: 0,
            left: 100,
            child: Text("This is Stack and Position"),
          )
        ],
      ),
    );
  }
}

class WrapSample extends StatelessWidget {
  const WrapSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      spacing: 10.0,
      children: [
        MyWrapButton("For Wrap", onPressed: () {}),
        MyWrapButton("For Wrap", onPressed: () {}),
        MyWrapButton("For Wrap", onPressed: () {}),
        MyWrapButton("For Wrap", onPressed: () {}),
        MyWrapButton("For Wrap", onPressed: () {}),
        MyWrapButton("For Wrap", onPressed: () {}),
        MyWrapButton("For Wrap", onPressed: () {})
      ],
    ));
  }
}

class MyWrapButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  MyWrapButton(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
              WidgetStatePropertyAll(const Color.fromARGB(255, 46, 37, 4)),
          foregroundColor: WidgetStatePropertyAll(Colors.white)),
      child: Text(text),
    ));
  }
}

class CustomizedIcon extends StatelessWidget {
  Color color;
  IconData icon;
  CustomizedIcon(this.icon, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 100,
      color: color,
      child: Icon(icon),
    );
  }
}

List<Widget> initListData() {
  List<Widget> list = [];
  List<String> listString = ["1", "2", "dfgs", "dfgs", "dfgsr"];

  for (var i = 0; i < listData.length; i++) {
    list.add(ListTile(title: Text(listData[i]["phone"])));
  }

  var tempList = listData.map((value) {
    return ListTile(
      title: Text(value["email"]),
    );
  }).toList();

  return tempList;
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //transform: Matrix4.translationValues(100, 20, 0),
      //transform: Matrix4.rotationY(0.5),
      alignment: Alignment.center,
      width: 200,
      height: 40,
      margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Button",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MyPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(color: Colors.amber),
      child: Image.network(
        "https://images.unsplash.com/photo-1717167172109-d4c95ddfa5c0?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8",
        fit: BoxFit.cover,
        //errorBuilder: (context, error, stackTrace) => ,
      ),
    );
  }
}









// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
