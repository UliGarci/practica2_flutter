import 'package:flutter/material.dart';
import 'package:learning_b/kernel/widgets/custom_text_field_password.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller = TextEditingController();

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
        title: Text('Crear cuenta'), 
        backgroundColor: Colors.pink,
        iconTheme: const IconThemeData(color:Colors.white),
        titleTextStyle: const TextStyle(fontSize: 16,color: Colors.white
        ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png',width: 200,height: 200,),
                Form(
                  key:_formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailcontroller,
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          hintText: 'Correo electrónico',
                          label: Text('Correo electrónico')
                        ),
                      ),
                      const SizedBox(height: 16,),
                      TextFieldPassword(controller: _passwordcontroller),
                      const SizedBox(height: 16,),
                      TextFieldPassword(controller: _confirmpasswordcontroller,hintText: 'Confirmar contraseña',labelText: 'Confirmar',),
                    ],
                  ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}