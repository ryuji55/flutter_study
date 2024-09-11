import 'package:flutter/material.dart';
import 'package:flutter_study/model/user.dart';
import 'package:flutter_study/pages/talkRoomPage.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(
        name: 'やのさん',
        uid: 'abc123',
        imageUrl:
            'https://yt3.googleusercontent.com/ngVd2-zv5o3pGUCfiVdZXCHhnq_g1Lo1Y8DbrmB9O8G7DG0IWUQJgsacqsI_LRvZE8JTsbQIuQ=s900-c-k-c0x00ffffff-no-rj',
        lastMessage: 'おはようございます！'),
    User(
        name: 'ゆーのすけさん',
        uid: 'def456',
        imageUrl:
            'https://yt3.googleusercontent.com/ngVd2-zv5o3pGUCfiVdZXCHhnq_g1Lo1Y8DbrmB9O8G7DG0IWUQJgsacqsI_LRvZE8JTsbQIuQ=s900-c-k-c0x00ffffff-no-rj',
        lastMessage: 'はす！'),
    User(
        name: 'ユウキさん',
        uid: 'def456',
        imageUrl:
            'https://yt3.googleusercontent.com/ngVd2-zv5o3pGUCfiVdZXCHhnq_g1Lo1Y8DbrmB9O8G7DG0IWUQJgsacqsI_LRvZE8JTsbQIuQ=s900-c-k-c0x00ffffff-no-rj',
        lastMessage: 'ラーメン美味しい！'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('トップページ'),
        ),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TalkRoomPage(userList[index].name)));
              },
              child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          foregroundImage: userList[index].imageUrl != null
                              ? NetworkImage(userList[index].imageUrl!)
                              : null,
                        ),
                        SizedBox(width: 10),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(userList[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text(userList[index].lastMessage,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.grey))
                            ])
                      ],
                    ),
                  )),
            );
          },
        ));
  }
}
