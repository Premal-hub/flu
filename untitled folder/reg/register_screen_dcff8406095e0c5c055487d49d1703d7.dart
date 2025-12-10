import 'package:flutter/material.dart';
import 'package:lj/class_c/register/api_service_register.dart';
import 'package:lj/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  bool isLoading = false;

  void _register() async {
    setState(() {
      isLoading = true;
    });

    final response = await ApiService().registerUser(
      nameController.text,
      surNameController.text,
      EmailController.text,
      PasswordController.text,
    );

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response['message'] ?? 'Unknown error')),
    );

    if(response['response_code'].toString() == "1"){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Home()));
    }

    print(response['message']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: surNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: EmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: PasswordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _register,
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
