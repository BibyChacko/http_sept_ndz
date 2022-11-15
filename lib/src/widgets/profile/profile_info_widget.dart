import 'package:api_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:api_cubit/src/models/user_data.dart';
import 'package:api_cubit/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoWidget extends StatefulWidget {
  final UserData userData;
  const ProfileInfoWidget(this.userData, {Key? key}) : super(key: key);

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_pin),
            title: Text(widget.userData.name ?? ""),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.maps_home_work_outlined),
            title: Text(widget.userData.getFullAddress()),
          ),
          const SizedBox(
            height: 200,
          ),
          AppButton(
            buttonLabel: "Change Password",
            onTap: () {},
          ),
          const SizedBox(
            height: 100,
          ),
          AppButton(
            buttonLabel: "Log out",
            onTap: () {
              context.read<AuthenticationCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}
