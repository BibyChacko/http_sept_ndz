import 'package:api_cubit/src/cubit/profile/profile_cubit.dart';
import 'package:api_cubit/src/widgets/app_load_error_widget.dart';
import 'package:api_cubit/src/widgets/app_loader.dart';
import 'package:api_cubit/src/widgets/profile/profile_info_widget.dart';
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
      create: (context) =>
      ProfileCubit()
        ..getProfileInfo(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Profile"),),
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if(state is ProfileLoading){
                return const AppLoader();
              }
              else if(state is ProfileLoadError){
                return  AppLoadErrorWidget(errorMessage: "Something went wrong,Please try again",
                    buttonLabel: "Login",
                    onButtonTap: (){
                        // TODO: Logout and navigate to login
                    });
              }else if(state is ProfileLoadSuccess){
                return ProfileInfoWidget(state.userData);
              }else{
               return const AppLoader();
              }
            },
          ),
        ),
      ),
    );
  }
}