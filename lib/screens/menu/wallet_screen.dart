import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:senior_project_ruccab/constant.dart';
import 'package:senior_project_ruccab/functions/functions.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double dollar = 3.8;
  late double lira;

  @override
  Widget build(BuildContext context) {
    lira = convertDollarsToLira(dollar);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          "Wallet",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: mainColor,
          ),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: mainColor,
            size: 30,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CreditCardWidget(
            cardNumber: "1234567890123456",
            expiryDate: "10/27",
            cardHolderName: "1234",
            cvvCode: "1234",
            showBackView: false,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
            bankName: 'RUCCAB',
            enableFloatingCard: true,
            floatingConfig: const FloatingConfig(
              isGlareEnabled: true,
              isShadowEnabled: true,
              shadowConfig: FloatingShadowConfig(),
            ),
            obscureCardNumber: true,
            obscureInitialCardNumber: false,
            obscureCardCvv: true,
            labelCardHolder: 'CARD HOLDER',
            cardType: CardType.mastercard,
            isHolderNameVisible: false,
            height: 250,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            width: MediaQuery.of(context).size.width,
            isChipVisible: true,
            isSwipeGestureEnabled: true,
            animationDuration: const Duration(milliseconds: 1000),
            cardBgColor: mainColor, // Set card color to mainColor
            chipColor: Colors.white,
            padding: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TOTAL",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${lira.toStringAsFixed(2)}LL",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${dollar.toStringAsFixed(2)}\$",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Image.asset(
                "assets/images/dollar_logo.png",
                height: 100,
              ),
            ],
          ),
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: mainColor,
            ),
            child: const Text(
              "DEPOSIT LOG",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
