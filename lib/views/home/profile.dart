import 'package:agridoc/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:agridoc/views/home/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Top section with profile picture and name
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green.shade300, Colors.green.shade600],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.black38,
                      backgroundImage: AssetImage(
                        'assets/images/man-1276384_960_720.jpg',
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            // List of options
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Handle settings option
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text('Orders'),
                    onTap: () {
                      Get.to(() => OrderScreen());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Rate us'),
                    onTap: () {
                      // Handle rate us option
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () {
                      _authBloc.add(Logout());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
