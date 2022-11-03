import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:untitled1/ChatPage.dart';
import 'package:untitled1/MainPage.dart';

void main() {
  runApp(MainPage());
}



class NavPage extends StatefulWidget{
  const NavPage({super.key});

  @override
  State<StatefulWidget> createState() =>
      _NavPage();

  static run() {
    runApp(const MaterialApp(
      home: NavPage(),
    ));
  }

}
class _NavPage extends State<NavPage>{

  @override
  Widget build(BuildContext context) =>
      _page(ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
        itemCount: 100,
        itemBuilder: (context, index) => _chat("name $index", "descriptions", "https://picfiles.alphacoders.com/280/280352.jpg", Random().nextInt(5)),
      ));

  _page(Widget? widget) =>
      ScaffoldGradientBackground(
          extendBody: true,
          gradient: const LinearGradient(
              colors: [
                Color(0xFFCB2B93),
                Color(0xFF9546C4),
                Color(0xFF2E61F4),
              ]
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _newChatName.text = "";
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _createChatForm();
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0
              );
            },
            tooltip: 'Create',
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 5,
            shape: const CircularNotchedRectangle(),
            color: Colors.blue,
            child: SizedBox(
              height: 50,
              child: Row(
                children: const [
                  IconButton(onPressed: null, icon: Icon(Icons.people)),
                  Spacer(),
                  IconButton(onPressed: null, icon: Icon(Icons.sort)),
                  IconButton(onPressed: null, icon: Icon(Icons.search)),
                ],
              ),
            ),
          ),
          body: Container(
            child: widget,
          ));





  _chat(String name, String description, String url, int countNoRead) =>
      ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage())),
        shape: const OutlineInputBorder(borderSide: BorderSide(width: 0), borderRadius: BorderRadius.all(Radius.circular(10))),
        tileColor: countNoRead == 0 ? Colors.black12 : Colors.white12,
        title: Row(
          children: [
            Text(name, style: TextStyle(color: Colors.white.withOpacity(0.9))),
            const SizedBox(width: 5),
            if(countNoRead != 0) Chip(label: Text(countNoRead.toString()), visualDensity: const VisualDensity(vertical: -4, horizontal: -4)),
            const SizedBox(width: 15),
            if(Random().nextBool()) const Icon(Icons.admin_panel_settings)
          ],
        ),
        subtitle: Text(description, style: TextStyle(color: Colors.white.withOpacity(0.9)),),
        leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(url)
        ),
        trailing: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
      );
  _createChatForm() =>
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFB0A8AC),
                  Color(0xFF5E5E60),
                  Color(0xFFB0A8AC),
                ]
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15)
            )
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField_1("Название чата", Icons.drive_file_rename_outline, _newChatName),
            hs(30),
            button_1("Создать", null)
          ],
        ),
      );

  final _newChatName = TextEditingController();
}