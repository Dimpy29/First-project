import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width

    // Adaptive width based on screen size
    double inputFieldWidth = screenWidth < 600
        ? screenWidth * 0.9 // For phones (90% of width)
        : screenWidth < 1024
        ? 500 // For tablets
        : 400; // For laptops

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade500,
          title: const Text('Login Page', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: inputFieldWidth,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
                          hintText: 'Enter email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: inputFieldWidth,
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    SizedBox(
                      width: inputFieldWidth,
                      child: MouseRegion(
                        onEnter: (_) => setState(() {}),
                        onExit: (_) => setState(() {}),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Logging in...')),
                              );
                            }
                          },
                          child: const Text('Login'),
                          color: Colors.teal,
                          textColor: Colors.white,
                          hoverColor: Colors.teal.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    SizedBox(
                      width: inputFieldWidth,
                      child: MouseRegion(
                        onEnter: (_) => setState(() {}),
                        onExit: (_) => setState(() {}),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: const Text('Forgot Password?'),
                          color: Colors.teal,
                          textColor: Colors.white,
                          hoverColor: Colors.teal.shade700, // Hover effect
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
