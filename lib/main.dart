import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/firebase_options.dart';
import 'package:flutter_study/pages/topPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TopPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // 押した後の処理をかく
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('ログインしました！'),
                          );
                        });
                  },
                  child: Text('ログインする')),
              ElevatedButton(
                  onPressed: () {
                    // 押した後の処理をかく
                  },
                  child: Text('新規登録する')),
              TextButton(
                  onPressed: () {
                    // 押した後の処理をかく
                  },
                  child: Text('パスワードを忘れた方はこちら')),
            ],
          ),
        ));
  }
}
