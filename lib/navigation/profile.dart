import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    child: Text('UG'),
                  ),
                  SizedBox(width: 8.0,),
                  Column(
                    children: [
                      Text("Daniel_GM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      Text("Tezoyuca", style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 69, 68, 68)),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            Image.asset('assets/dubai.jpeg',width: double.infinity,height: 300,),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.favorite_border),
                  Icon(Icons.message),
                  Icon(Icons.ios_share),
                  Spacer(),
                  Icon(Icons.bookmark_border)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Ulises García'),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('aqui descansando un rato, con las hermosas vistas de mi hermoso tezoyuca'),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('30-02-2024'),
            )
          ],
        ),
      ),
    );
  }
}