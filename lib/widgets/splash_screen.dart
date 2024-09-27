import 'package:flutter/material.dart';
import 'package:learning_b/widgets/home.dart';

class SplashScreen extends StatelessWidget {
const SplashScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Center(
      child: Image.asset('assets/logo.png',width: 200,height: 200)
    );
  }
}