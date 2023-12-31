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
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              height: 150,
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
                    radius: 80,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue), // Change button color here
                      ),
                      child: Text(
                        users.values.elementAt(i).values.elementAt(1),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white, // Change text color
                        ),
                      ),
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
