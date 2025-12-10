import 'package:flutter/material.dart';
import 'package:lj/class_a/login/api_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 400,
              child: TextField(
                controller: EmailController,
                // maxLines: 3,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    // suffixIcon: Icon(Icons.person),
                    label: Text("Enter Your Email"),
                    // hintText: "Enter Name",
                    // helperText: "Enter Name",
                    //  border: OutlineInputBorder(
                    //    borderSide: BorderSide(
                    //      color: Colors.orange
                    //    )
                    //  ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.greenAccent
                        )
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 400,
              child: TextField(
                controller: passwordController,
                obscureText: false,
                // maxLines: 3,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    // suffixIcon: Icon(Icons.person),
                    label: Text("Enter Password"),
                    // hintText: "Enter Name",
                    // helperText: "Enter Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.greenAccent
                        )
                    )
                ),
              ),
            ),
          ),

          Center(
            child: ElevatedButton(
                onPressed: (){
                  print("login");
                  final respo = ApiServices().login(
                      EmailController.text,
                      passwordController.text
                  );

                  },
                child: Text("Login")),
          )
        ],
      ),
    );
  }
}
