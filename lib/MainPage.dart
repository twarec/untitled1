import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/main.dart';

class MainPage extends StatelessWidget{
  final TextEditingController _authLogin = TextEditingController();
  final TextEditingController _authPassword = TextEditingController();

  final TextEditingController _regLogin = TextEditingController();
  final TextEditingController _regPassword = TextEditingController();
  final TextEditingController _regRePassword = TextEditingController();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: _authorizationPage(),
      );


  _authorizationPage() =>
      _page("Авторизация", Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textField_1("Логин", Icons.person_outline, _authLogin),
          hs(20),
          textField_1("Пароль", Icons.lock_outline, _authPassword, isPassword: true),
          hs(30),
          button_1("Вход", (){
            NavPage.run();
          }),
          hs(20),
          _registration()
        ],
      ));
  _registrationPage() =>
      _page("Регистрация", Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textField_1("Логин", Icons.person_outline, _regLogin),
          hs(20),
          textField_1("Пароль", Icons.lock_outline, _regPassword, isPassword: true),
          hs(20),
          textField_1("Повторите пароль", Icons.lock_outline, _regRePassword, isPassword: true),
          hs(30),
          button_1("Регистрация", (){
            NavPage.run();
          }),
        ],
      ));

  _page(String title, Widget child) =>
      Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(title, style: GoogleFonts.lobster(textStyle: const TextStyle(color: Colors.white54))),
          ),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFCB2B93),
                      Color(0xFF9546C4),
                      Color(0xFF2E61F4),
                    ]
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: child,
            ),
          )
      );
  _registration() =>
      Builder(builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Аккаунт отсутсвует?", style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => _registrationPage()));
            },
            child: const Text(" Регистрация",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ],
      ));
}

textField_1(String text, IconData icon, TextEditingController controller, {bool isPassword = false}) =>
    TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white.withOpacity(0.9)),
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          prefixIcon: Icon(icon, color: Colors.white70),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.3),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(width: 0, style: BorderStyle.none))
      ),
    );
button_1(String text, Function()? onPressed) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states)
          {
            if(states.contains(MaterialState.pressed)){
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
      ),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        width: const Size.fromHeight(50).width,
        child: Text(text,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16
            )),
      ),
    );
hs(double y) => SizedBox(height: y);
ws(double x) => SizedBox(width: x);
hvs(double x, double y) => SizedBox(height: y, width: x);
