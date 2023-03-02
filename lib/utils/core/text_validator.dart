class TextValidator {
  TextValidator._();

  static const _phoneRegex = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  // static const _phoneInternationalRegex =
  //     r'/^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/';
  static const _emailRegex =
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";

  static String? nameValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.length < 3) {
        return 'Required';
      } else {
        return null;
      }
    } else {
      return 'Required';
    }
  }

  static String? priceValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      final trimed = value.trim();
      if (int.parse(trimed) <= 0) {
        return 'Price must not be 0';
      } else {
        return null;
      }
    } else {
      return 'Required';
    }
  }

  static String? emailValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isEmpty) {
        return 'Required';
      } else if (RegExp(_emailRegex).hasMatch(trimed)) {
        return null;
      } else {
        return 'Invalid Email';
      }
    } else {
      return 'Required';
    }
  }

  static String? passwordValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isEmpty) {
        return 'Required';
      } else if (trimed.length < 8) {
        return 'Weak Password';
      } else {
        return null;
      }
    } else {
      return 'Required';
    }
  }

  static String? optionalPasswordValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isEmpty) {
        return 'Required';
      } else {
        return null;
      }
    } else {
      return 'Required';
    }
  }

  static String? unitValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isNotEmpty) {
        return null;
      } else {
        return 'Required';
      }
    } else {
      return 'Required';
    }
  }

  static String? phoneValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isEmpty) {
        return 'Required';
      } else if (RegExp(_phoneRegex).hasMatch(trimed)) {
        return null;
      } else {
        return 'Invalid Phone Number';
      }
    } else {
      return 'Required';
    }
  }

  static String? optionalEmailValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isEmpty) {
        return null;
      } else if (RegExp(_emailRegex).hasMatch(trimed)) {
        return null;
      } else {
        return 'Invalid Email';
      }
    } else {
      return null;
    }
  }

  static String? optionalPhoneValidator(String? value) {
    if (value != null) {
      final trimed = value.trim();
      if (trimed.isEmpty) {
        return null;
      } else if (RegExp(_phoneRegex).hasMatch(trimed)) {
        return null;
      } else {
        return 'Invalid Phone Number';
      }
    } else {
      return null;
    }
  }
}
