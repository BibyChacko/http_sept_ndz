import 'package:api_cubit/src/cubit/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileInfo(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Profile"),),
        body: SafeArea(
          child: Text("Profile"),
        ),
      ),
    );
  }
}