import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppMask {
  static final DateFormat formatter = DateFormat('dd / MM /yyyy');
  static final DateFormat _caseDateFormatter = DateFormat('MMM dd, yyyy');
  static final DateFormat _caseTimeFormatter = DateFormat('HH : mm');
  static final DateFormat _apiDateTimeFormatter =
      DateFormat("yyyy-MM-ddTHH:mm:ss+00:00"); //2022-03-15T06:46:00+00:00

  static MaskTextInputFormatter card() {
    return MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter otp() {
    return MaskTextInputFormatter(
      mask: '##-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter date() {
    return MaskTextInputFormatter(
      mask: '## / ## / ####',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter ssnNumber() {
    return MaskTextInputFormatter(
      mask: '###-##-####',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter expiryDate() {
    return MaskTextInputFormatter(
      mask: '##/##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static MaskTextInputFormatter caseNumber() {
    return MaskTextInputFormatter(
      mask: '####################',
      filter: {
        "#": RegExp(
            r'[1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM!@#$%^&*()_+-/?.,`~±§ ]')
      },
    );
  }

  static MaskTextInputFormatter judgementAmount() {
    return MaskTextInputFormatter(
      mask: r'$###############',
      filter: {"#": RegExp(r'[0123456789.,]')},
    );
  }

  static MaskTextInputFormatter ccv() {
    return MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  static String? removePhoneOtherCharacters(String? phone) {
    if (phone == null || phone.isEmpty) return phone;
    return phone
        .replaceAll(" ", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll("+", "")
        .replaceFirst("998", "")
        .replaceAll("-", "");
  }

  static String? removeCardOtherCharacters(String? number) {
    if (number == null || number.isEmpty) return number;
    return number.replaceAll(" ", "").replaceAll("/", "");
  }

  static formatPhoneNumber(String? phone) {
    if (phone != null && phone.length == 12 && phone.startsWith("998")) {
      return "+ 998 (${phone.substring(3, 5)}) ${phone.substring(5, 8)} ${phone.substring(8, 10)} ${phone.substring(10, 12)}";
    } else {
      return phone;
    }
  }

  static String? formatDate(DateTime? dateTime) {
    if (dateTime == null) return null;
    return formatter.format(dateTime);
  }

  static String apiDateFormat(DateTime dateTime) {
    return _apiDateTimeFormatter.format(dateTime);
  }

  static String caseDateFormat(DateTime dateTime) {
    return _caseDateFormatter.format(dateTime);
  }

  static String caseTimeFormat(DateTime dateTime) {
    return _caseTimeFormatter.format(dateTime);
  }
}

abstract class InputMasks {
  static MaskedTextController get phoneNumber =>
      MaskedTextController(mask: "+998 00 000 00 00", text: "+998 ")
        ..beforeChange = _phoneChanger;

  static bool _phoneChanger(String prev, String next) {
    if (next.length <= 4) return false;
    return true;
  }

  static Map<String, RegExp> _digitTranslator = {'#': RegExp(r'[0-9]')};
}

extension StringExtensions on String {
  String truncate(int limit) {
    if (this.isNotEmpty && this.length > limit) {
      return this.substring(0, limit) + " ...";
    } else {
      return this;
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension DateExtensions on DateTime {
  String format1() {
    return "$hour : $minute $year-$month-$day"; // something like 2013-04-20
  }
}