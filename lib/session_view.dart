import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/session_cubit.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Session View'),
            TextButton(
              onPressed: () => BlocProvider.of<SessionCubit>(context).signOut(),
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
