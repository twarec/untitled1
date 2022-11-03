import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:untitled1/MainPage.dart';

class ChatPage extends StatefulWidget{
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage>{

  late TextEditingController _messageController;
  final List<String> _messages = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageController = TextEditingController();
    _messageController.addListener(() {setState(() {});});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) =>
      ScaffoldGradientBackground(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35)
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(backgroundImage: NetworkImage("https://picfiles.alphacoders.com/280/280352.jpg")),
              ws(15),
              Text("Чат", style: GoogleFonts.lobster(textStyle: const TextStyle(color: Colors.white54)))
            ],
          ),
        ),
        gradient: const LinearGradient(
            colors: [
              Color(0xFFCB2B93),
              Color(0xFF9546C4),
              Color(0xFF2E61F4),
            ]
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) => _message(_messages[index], index % 2 == 0),
                ),
              ),
              Row(
                children: [
                  Expanded(child: textField_1("Введите сообщение", Icons.message, _messageController)),
                  hs(10),
                  IconButton(onPressed: _messageController.text.isNotEmpty ? () {
                    setState(() {
                      _messages.add(_messageController.text);
                      _messageController.text = "";
                    });
                  } : null, icon: const Icon(Icons.send, size: 35,))
                ],
              )
            ],
          ),
        ),
      );

  _message(String text, bool isReceiver) =>
      Container(
        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
        child: Align(
          alignment: (isReceiver ? Alignment.topLeft : Alignment.topRight),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (isReceiver ? Colors.grey.shade200 : Colors.blue[200]),
            ),
            padding: EdgeInsets.all(16),
            child: Text(text, style: TextStyle(fontSize: 15),),
          ),
        ),
      );
}