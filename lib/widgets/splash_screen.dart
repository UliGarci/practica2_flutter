import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
const SplashScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return home();
  }
}

class home extends StatelessWidget {
  const home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text('primer columna'),
                Text('primer parrafo')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text('segunda columna'),
                Text('segundo parrafo')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text('tercer columna'),
                Text('tercer parrafo')
              ],
            ),
          )
        ],
      ),
    );
  }
}