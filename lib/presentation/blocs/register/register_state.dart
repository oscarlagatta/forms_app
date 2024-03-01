part of 'register_cubit.dart';

enum FormStatus {
  invalid,
  valid,
  validating,
  posting,
}

class RegisterFormState extends Equatable {
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const UserName.pure(), // set default value
    this.email = const Email.pure(),
    this.password = const Password.pure(), // initial value in pure
  });

  final FormStatus formStatus;
  final bool isValid;
  final UserName username;
  final Email email;
  final Password password;

  @override
  List<Object> get props => [
        formStatus,
        username,
        email,
        password,
      ];

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    UserName? username,
    Email? email,
    Password? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}

// Initial version

// abstract class RegisterFormState extends Equatable {
//   const RegisterFormState();
// }
//
// class RegisterInitial extends RegisterFormState {
//   @override
//   List<Object> get props => [];
// }
