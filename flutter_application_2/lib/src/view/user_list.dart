import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/data/dummy_users.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USER};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 144, 0, 154),
        title: Center(
          child: Text(
            'Lista de Usuários',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
        ),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => Center(
            child: Container(
              width: 200,
              height: 180,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/data/imagns/IMG.jpg',
                    ),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    users.values.elementAt(i).values.elementAt(1),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
