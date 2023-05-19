import 'package:flutter/material.dart';

import '../pages/raise_page.dart';

class RaisePageModel extends ChangeNotifier {
  String _title = 'Guest';
  IconData _titleIcon = Icons.person;
  late String _guestText;

  void statusChecker({required Statuses status}) {
    switch (status) {
      case Statuses.guest:
        _title = "Guest";
        _titleIcon = Icons.person;
        _guestText =
            'The guest status allows you to get acquainted with the various sections of wallet, 450+ services and useful features.Tellcell Wallet is with you 24/7.To make transactions, raise your status and become an EXPERT by attaching a passport and bank card. And if you also open a bank account right from the wallet, you wil become a Guru and enjoy all the benefits';

        break;

      case Statuses.expert:
        _title = "Expert";
        _titleIcon = Icons.person_2;
        _guestText =
            'The Expert status allows you to fully use 450+ services of the wallet, make payments and transfers, get loans online, buy tickets,exchange collected BONuses with gifts and much more. By attaching a passport and bank card to the wallet,you will take an adventage of the montioned features. And if you also open a bank account right from the wallet, you will become a GURU and enjoy all the adventages. Telcell wallet is with you 24/7';

        break;
      case Statuses.guru:
        _title = "Guru";
        _titleIcon = Icons.person_3;
        _guestText =
            'The Guru status allows you to use all features of Telcell eallet with 100%, as well as replanish the wallet with Tellcell terminals anytime.you can make paymants and transfers, get loans online, buy tickets , exchangecollected BONuses with gifts and much more.Attach your passport, bank card and open a bank account right from the wallet and enjoy all the benefits. Telcell wallet is with you 24/7';

        break;
    }
  }

  get title {
    return _title;
  }

  get titleIcon => _titleIcon;
  get guestText => _guestText;
}
