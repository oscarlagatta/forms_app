import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    // set the form in a different state

    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: UserName.dirty(value: state.username.value), // set dirty
        password: Password.dirty(value: state.password.value),
        email: Email.dirty(value: state.email.value),
        isValid: Formz.validate(
          [
            state.username,
            state.email,
            /// TODO: state.email,
            state.password,
          ],
        ),
      ),
    );
    print('Cubit Submit: $state');
  }

  void usernameChanged(String value) {
    final userName = UserName.dirty(value: value);

    emit(state.copyWith(
      username: userName,
      isValid: Formz.validate([
        userName,
        state.password,
        state.email,
      ]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value: value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([
        email,
        state.username,
        state.password,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value: value);

    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([
        password,
        state.username,
        state.email,
      ]),
    ));
  }
}
