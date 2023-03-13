import 'package:agridoc/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:agridoc/languages/language.dart';
import 'package:agridoc/languages/language_en.dart';
import 'package:agridoc/widgets/dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  late final AuthBloc _authBloc;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    print("IN build...");
    return Scaffold(
      body: LoaderOverlay(
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocListener<AuthBloc, AuthBlocState>(
              listener: (context, state) {
                // if (state is AuthAuthenticated) {
                //   Navigator.pushNamedAndRemoveUntil(
                //       context, '/home', (route) => false);
                // }
              },
              child: BlocBuilder<AuthBloc, AuthBlocState>(
                bloc: _authBloc,
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: SizedBox(
                        //     width: MediaQuery.of(context).size.width * 0.6,
                        //     height: MediaQuery.of(context).size.height * 0.27,
                        //     child: Image.asset(
                        //       'assets/images/loginpagedesign.png',
                        //       fit: BoxFit.fill,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          Languages.of(context).appName,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _username,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              size: 20,
                            ),
                            label: Text(Languages.of(context).username),
                          ),
                        ),

                        TextFormField(
                          controller: _phone,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 20,
                            ),
                            label: Text(Languages.of(context).phone),
                          ),
                        ),

                        TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              size: 20,
                            ),
                            suffix: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            label: Text(Languages.of(context).password),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            _authBloc.add(SignUp(
                                username: _username.text,
                                password: _password.text,
                                phone: _phone.text));
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            maximumSize: const Size(double.infinity, 50),
                          ),
                          child: state is AuthLoading
                              ? showLoading(context)
                              : Text(
                                  state is AuthUnauthenticated
                                      ? Languages.of(context).signUp
                                      : "user created",
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
