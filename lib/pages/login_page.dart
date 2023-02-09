import 'package:flutter/material.dart';
import 'package:projeto_nv1/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Login'),
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text('Senha'),
              ),
              onChanged: _controller.setPass,
            ),
            const SizedBox(
              height: 15,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _controller.isLoading,
              builder: (_, isLoading, __) => isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _controller.auth().then((result) {
                          if (result) {
                            print('sucess');
                          } else {
                            print('failed');
                          }
                        });
                      },
                      child: const Text('Login'),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
