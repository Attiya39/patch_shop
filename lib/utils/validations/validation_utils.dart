import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class ValidationUtils {
  static bool isEmailValid(String? email) {
    return email != null &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
  }

  ///Special character Case
  static bool hasSpecialCharacter(String? password) {
    return password != null &&
        RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
  }

  // Function to check if the field is not null and not empty and has at least 3 characters
  static bool isFieldValid(String? field) {
    // Check if the field is not null and not empty
    if (field == null || field.isEmpty) {
      debugPrint("Field must not be left empty.");
      return false;
    }
    // Check if the field has at least 3 characters
    if (field.length < 3) {
      debugPrint("Minimum 3 characters required.");
      return false;
    }
    return true;
  }

// Function to check if the ZIP Code field is not null and not empty and zip code shall be 5 digits
  static bool isZipCodeValid(String? zipCode) {
    // Check if the field is not null and not empty
    if (zipCode == null || zipCode.isEmpty) {
      debugPrint("Field must not be left empty.");
      return false;
    }
    // Check if the field has at least 5 characters
    if (zipCode.length != 5) {
      debugPrint("Minimum 5 characters required.");
      return false;
    }
    return true;
  }

  // otp validation for exactly 6 digits
  static bool isOtpValid(String? otp) {
    if (otp == null || otp.isEmpty) {
      return false;
    }
    return otp.length == 6;
  }

  ///Minimum character Case
  static bool hasMinimumCharacters(String password, int minimumLength) {
    return password.length >= minimumLength;
  }

  static bool isPhoneValid(String callingCode, String phone) {
    try {
      final value = "$callingCode$phone";
      return PhoneNumber.parse(value).isValid();
    } catch (_) {
      return false;
    }
  }

  static String? isPasswordValid(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 8) {
      return 'Password should be 8 characters or more';
    }

    if (password.length > 15) {
      return 'Password should not exceed 15 characters';
    }
    return null;
  }
}
