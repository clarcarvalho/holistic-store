import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mockapi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await MockAPI.login(email, password);

    setState(() {
      if (response['status'] == 'success') {
        _message = 'Login bem-sucedido! Token: ${response['token']}';
        Navigator.popAndPushNamed(context, '/products');
      } else {
        _message = 'Erro: ${response['message']}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Holistic Store'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 249, 161, 190),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Entre com os seus dados de login: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              CupertinoTextField(
                controller: _emailController,
                padding: const EdgeInsets.all(12),
                placeholder: "Digite seu e-mail",
                placeholderStyle:
                    const TextStyle(color: Colors.white70, fontSize: 14),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _passwordController,
                padding: const EdgeInsets.all(12),
                placeholder: "Digite sua senha",
                obscureText: true,
                placeholderStyle:
                    const TextStyle(color: Colors.white70, fontSize: 14),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Colors.white,
                      onPressed: _login,
                      child: const Text(
                        "Acessar",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
