import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthorizationModel extends ChangeNotifier {
  String _pinCode = '';
  final String _realPin = '5693';

  late final LocalAuthentication _auth;
  bool _supportState = false;

  AuthorizationModel() {
    _auth = LocalAuthentication();
    _auth.getAvailableBiometrics().then((value) {
      _supportState = value.isNotEmpty;
      notifyListeners();
    });
  }

  void addDigit(String digit, Function callback) {
    if (_pinCode.length < 4) {
      _pinCode += digit;
      notifyListeners();
      if (_pinCode == _realPin) {
        Timer(const Duration(milliseconds: 10), () {
          callback();
        });
      } else if (_pinCode.length == 4 && _pinCode != _realPin) {
        Timer(const Duration(milliseconds: 500), () {
          _pinCode = '';
          notifyListeners();
        });
      }
    }
  }

  Future<bool> authenticate() async {
    try {
      final authenticated = await _auth.authenticate(
        localizedReason: "FingerPrint",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      return authenticated;
    } catch (e) {
      return false;
    }
  }

  get supportState {
    return _supportState;
  }

  String get pinCode => _pinCode;
  setPinCode(String pinCode) {
    _pinCode = pinCode;
    notifyListeners();
  }
}
