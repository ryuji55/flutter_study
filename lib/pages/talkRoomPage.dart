import 'package:flutter/material.dart';

import 'package:flutter_study/model/message.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoomPage extends StatefulWidget {
  final String name;
  const TalkRoomPage(this.name, {super.key});

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  List<Message> messageList = [
    Message(
        message: 'こんにちは', isMe: true, sendTime: DateTime(2024, 1, 1, 12, 0)),
    Message(
        message: 'ちゅーす', isMe: false, sendTime: DateTime(2024, 1, 1, 13, 0)),
    Message(
        message: '元気ですか？', isMe: true, sendTime: DateTime(2024, 1, 1, 14, 0)),
    Message(
        message: '元気です！', isMe: false, sendTime: DateTime(2024, 1, 1, 15, 0)),
    Message(
        message:
            'お腹すいたよ、今日はハワイの別荘にサーフィンしに行って、その後の夕飯で美味しいイタリアンのコースを食べに行きたいな！ファーストクラスの飛行機で行こうね！',
        isMe: true,
        sendTime: DateTime(2024, 1, 1, 16, 0)),
    Message(
        message: 'こんにちは', isMe: true, sendTime: DateTime(2024, 1, 1, 12, 0)),
    Message(
        message: 'ちゅーす', isMe: false, sendTime: DateTime(2024, 1, 1, 13, 0)),
    Message(
        message: '元気ですか？', isMe: true, sendTime: DateTime(2024, 1, 1, 14, 0)),
    Message(
        message: '元気です！', isMe: false, sendTime: DateTime(2024, 1, 1, 15, 0)),
    Message(
        message:
            'お腹すいたよ、今日はハワイの別荘にサーフィンしに行って、その後の夕飯で美味しいイタリアンのコースを食べに行きたいな！ファーストクラスの飛行機で行こうね！',
        isMe: true,
        sendTime: DateTime(2024, 1, 1, 16, 0)),
    Message(
        message: 'こんにちは', isMe: true, sendTime: DateTime(2024, 1, 1, 12, 0)),
    Message(
        message: 'ちゅーす', isMe: false, sendTime: DateTime(2024, 1, 1, 13, 0)),
    Message(
        message: '元気ですか？', isMe: true, sendTime: DateTime(2024, 1, 1, 14, 0)),
    Message(
        message: '元気です！', isMe: false, sendTime: DateTime(2024, 1, 1, 15, 0)),
    Message(
        message:
            'お腹すいたよ、今日はハワイの別荘にサーフィンしに行って、その後の夕飯で美味しいイタリアンのコースを食べに行きたいな！ファーストクラスの飛行機で行こうね！',
        isMe: true,
        sendTime: DateTime(2024, 1, 1, 16, 0)),
    Message(
        message: 'こんにちは', isMe: true, sendTime: DateTime(2024, 1, 1, 12, 0)),
    Message(
        message: 'ちゅーす', isMe: false, sendTime: DateTime(2024, 1, 1, 13, 0)),
    Message(
        message: '元気ですか？', isMe: true, sendTime: DateTime(2024, 1, 1, 14, 0)),
    Message(
        message: '元気です！', isMe: false, sendTime: DateTime(2024, 1, 1, 15, 0)),
    Message(
        message:
            'お腹すいたよ、今日はハワイの別荘にサーフィンしに行って、その後の夕飯で美味しいイタリアンのコースを食べに行きたいな！ファーストクラスの飛行機で行こうね！',
        isMe: true,
        sendTime: DateTime(2024, 1, 1, 16, 0)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                // shrinkWrap: true,
                reverse: true,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: index == 0 ? 10 : 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: messageList[index].isMe
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: messageList[index].isMe
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width *
                                  0.6, //画面幅の60%
                            ),
                            child: Text(
                              messageList[index].message,
                              softWrap: true, // 自動的に改行
                              maxLines: null, // 行数制限なしでテキストを表示
                            )),
                        Text(intl.DateFormat('HH:mm')
                            .format(messageList[index].sendTime)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: [
                        const Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'メッセージを入力',
                                    contentPadding: const EdgeInsets.all(10),
                                    border: OutlineInputBorder()))),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.send))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).padding.bottom,
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ],
        ));
  }
}
