import 'package:dio/dio.dart';
import 'package:e_commerce_fruits_app/services/Provider/provider_state.dart';
import 'package:e_commerce_fruits_app/services/Stripe/stripe_key.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  StripeServices._();

  static final StripeServices instance = StripeServices._();

  Future<void> makePayment() async {
    FavouriteItem favouriteItem = FavouriteItem();

    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(10, 'usd');
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentClientSecret,
              merchantDisplayName: 'Alishba Khan'));
      await _processPayment();
    } catch (e) {
      print(e);
      // print('Error during payment creation: $e');
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      final data = {
        'amount': _calculatorAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $secretKey',
            "Content_Type": 'application/x-www-form-urlencoded'
          },
        ),
      );

      if (response.data != null) {
        return response.data['client_secret'];
      }
      return null;
    } catch (e) {
      print(e);
      // print('Error: ${e.toString()}');
      // if (e is DioException) {
      //   print('Response Status Code: ${e.response?.statusCode}');
      //   print('Response Data: ${e.response?.data}');
      // }
      return null;
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print(e);
    }
  }

  String _calculatorAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}
