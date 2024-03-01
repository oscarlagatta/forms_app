import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // every time the state changes it will trigger the rendering of this
    // build.
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      // key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Name',
            onChanged: registerCubit.usernameChanged,
            // _formKey.currentState?.validate();
            // onChanged: (value) {
            //   registerCubit.usernameChanged(value);
            //   // _formKey.currentState?.validate();
            // },
            // onChanged: (value) => username = value,
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Field is Required';
            //   if (value.trim().isEmpty) return 'Field is Required';
            //   if (value.length < 6) return 'Must be more than 6 characters';
            //   return null;
            // },
            // errorMessage: username.isPure || username.isValid
            //     ? null
            //     : 'User Not Valid',
            errorMessage: username.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            onChanged: registerCubit.emailChanged,
            // onChanged: (value) {
            //   registerCubit.passwordChanged(value);
            //   // _formKey.currentState?.validate();
            // },
            // onChanged: (value) {
            //   registerCubit.emailChanged(value);
            //   _formKey.currentState?.validate();
            // },
            // onChanged: (value) => email = value,
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Field is Required';
            //   if (value.trim().isEmpty) return 'Field is Required';
            //   final emailRegExp = RegExp(
            //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            //   );
            //   if (!emailRegExp.hasMatch(value)) return 'Not an Email';
            //   return null;
            // },
            errorMessage: email.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Password',
            obscured: true,
            onChanged: registerCubit.passwordChanged,
            // onChanged: (value) => password = value,
            // onChanged: (value) {
            //   registerCubit.passwordChanged(value);
            //   // _formKey.currentState?.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Field is Required';
            //   if (value.trim().isEmpty) return 'Field is Required';
            //   if (value.length < 6) return 'Must be more than 6 characters';
            //   return null;
            // },
            errorMessage: password.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // print('$username $email $password');
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create user'),
          ),
        ],
      ),
    );
  }
}
