import 'package:formz/formz.dart';

enum UserNameValidationError { invalid }

class TextValidator extends FormzInput<String, UserNameValidationError > {
  const TextValidator.pure() : super.pure('');
  const TextValidator.dirty([String value = '']) : super.dirty(value);

  static final _userNameRegExp =
      RegExp(r'^[a-zñ A-ZÑ]+$');

  @override
  UserNameValidationError? validator(String? value) {
    return _userNameRegExp.hasMatch(value!)
        ? null
        : UserNameValidationError.invalid;
  }
}