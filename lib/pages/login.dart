import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/controllers/login/login_bloc.dart';
import 'package:test1/repositories/auth_repo.dart';
import 'package:test1/utils/toast.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
/*   final _formKey = GlobalKey<FormState>(); // Key for form validation
  final String _username = '';
  String _password = '';
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(authenticationRepository: AuthenticationRepository()),
      
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
               if (state.status.isFailure) {
                 errorToast('Authentication Failed successfully');
               }
              if(state.status.isSuccess){
                successToast('authentication failed to failed');
                context.go('/introduction');
              }
              // TODO: implement listener
            },
            child: 
             const AuthForm(type: SubmitType.login,),
          ),
        ),
      ),
    );
  }
}
