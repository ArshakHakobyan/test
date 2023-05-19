import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:telcell_copy/api/api_constants.dart';

class PaymentCards {
  final Dio _dio = Dio();
  String creditCardsBaseUrl = APIconstants.creditCardsBaseUrl;

  Future<List<CreditCardWidget>> fetchData(recource) async {
    List<CreditCardWidget> creditCardWidgetList = [];

    Response response = await _dio.get(creditCardsBaseUrl + recource);
    if (response.statusCode == HttpStatus.ok) {
      for (int item = 0; item < response.data.length; item++) {
        creditCardWidgetList.add(CreditCardWidget(
          cardHolderName: response.data[item]['card_holder'],
          cardNumber: response.data[item]['card_number'],
          cvvCode: response.data[item]['cvv'],
          expiryDate: response.data[item]['expiration_date'],
          labelCardHolder: response.data[item]['id'],
          glassmorphismConfig: Glassmorphism(
            blurX: 50,
            blurY: 50,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(int.tryParse(
                        response.data[item]['color']!.substring(6, 16)) ??
                    5),
                const Color.fromARGB(255, 144, 102, 35)
              ],
            ),
          ),
          bankName: "ID Bank",
          showBackView: false,
          onCreditCardWidgetChange: (p0) => {},
          isHolderNameVisible: true,

          // ignore: non_constant_identifier_names
        ));
      }
      return creditCardWidgetList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> postData(Map<String, String> data) async {
    Response response = await _dio.
    post(
      '$creditCardsBaseUrl/credit_cards /',
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to post data');
    }
  }
}
