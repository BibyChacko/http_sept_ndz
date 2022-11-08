
import 'package:api_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json api"),
        centerTitle: true,
      ),
      body: SafeArea(child: _buildLoginForm(context)),
    );
  }

  _buildLoginForm(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Username",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _emailController,
              validator: DataValidator.isValidEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Email Address",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _passwordController,
              validator: DataValidator.isValidPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off),
                  ),
                  labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.library_books_outlined),
                  ),
                  labelText: "Address",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(7))),
            ),
            SizedBox(
              height: 15,
            ),
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccess) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                }else if(state is AuthenticationFailure){
                  showDialog(context: context,builder:(_,){
                    return AlertDialog(
                      title: Text("Login Failed"),
                      content: Text("Check your credentials"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Ok"))
                      ],
                    );
                  });
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CupertinoActivityIndicator());
                }
                return ElevatedButton(
                    onPressed: () {
                      context.read<Auth>().login(
                          _emailController.text.trim(),
                          _passwordController.text);
                    },
                    child: Text("Login"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
