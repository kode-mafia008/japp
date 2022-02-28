class Validators {
  static String? taskNameValidator(value) {
    if (value!.isEmpty) {
      return 'Task Name is Required.';
    }

    return null;
  }

  static String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Password is Required';
    }
    // if (value.length < 8) {
    //   return 'Password must be at least 8 characters.';
    // }
    return null;
  }

  static String? confirmPasswordValidator(String value1, String value2) {
    if (value1 != value2) {
      return 'Password and Confirm password do not match';
    }
    return null;
  }
}
