import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
  // Expresión regular para validar un correo electrónico
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (value == null || value.isEmpty) {
    return 'Por favor, ingrese su correo electrónico';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Por favor, ingrese un correo electrónico válido';
  }
  return null; // Si es válido, no devuelve ningún error
}

String? validatePassword(String? value){
  if(value==null || value.isEmpty){
    return 'Ingrese una contraseña';
  }else{
    return null;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(205, 55, 166,1),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/instagram3.webp',width: 200,height: 200),
                const SizedBox(height: 16,),
                TextFormField(
                  validator: validateEmail,
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Correo Electronico',
                    label: Text('Correo Electronico')
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: _passwordcontroller,
                  obscureText: _isObscure,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off))
                  ),
                ),
                const SizedBox(height: 50,),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
                          print("credencial: $credential");
                        } catch (e) {
                          print('Error en firebase: $e');
                        }
                        // print('Datos -> ${_emailcontroller.text} ${_passwordcontroller.text}');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    ),
                    child: const Text('Iniciar sesión')
                    ),
                ),
                const InkWell(
                  child: Text('Crear cuenta'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}