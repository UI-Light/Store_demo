import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store_demo/ui/shared/card_pay_button.dart';
import 'package:store_demo/ui/shared/textfield.dart';
import 'package:store_demo/ui/views/congratulation_screen.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class CheckoutBottomSheet extends StatefulWidget {
  const CheckoutBottomSheet({Key? key}) : super(key: key);

  @override
  State<CheckoutBottomSheet> createState() => _CheckoutBottomSheetState();
}

class _CheckoutBottomSheetState extends State<CheckoutBottomSheet> {
  TextEditingController controller = TextEditingController();

  String publicKeyTest = 'pk_test_6972397d1bd678cd6e73da062b27c388f6aa99b0';

  final plugin = PaystackPlugin();

  @override
  void initState() {
    //initialize the publicKey
    plugin.initialize(publicKey: publicKeyTest);
    super.initState();
  }

  //a method to show the message
  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //used to generate a unique reference for payment
  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard() async {
    var charge = Charge()
      ..amount = 1000 *
          100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = 'test@email.com';

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => const CongratulationScreen()),
        ),
      );
    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Address',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          TextfieldWidget(
            controller: controller,
            hintText: '10th avenue, Lekki, Lagos State',
            obscureText: false,
          ),
          const SizedBox(height: 15),
          const Text(
            'Number we can call',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          TextfieldWidget(
            controller: controller,
            hintText: '09090605708',
            obscureText: false,
          ),
          const SizedBox(height: 15),
          const Text(
            'Email Address',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          TextfieldWidget(
            controller: controller,
            hintText: 'jane@gmail.com',
            obscureText: false,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const CongratulationScreen()),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'Pay on delivery',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                CardPayButton(callback: () => chargeCard()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
