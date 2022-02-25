import 'package:flutter/material.dart';

import 'package:task_app/resources/colors.dart';
import 'package:task_app/resources/strings.dart';

class WalletBalanceTile extends StatelessWidget {
  final double balance;
  final Function onAddMoney;

  const WalletBalanceTile(
      {Key? key, required this.balance, required this.onAddMoney})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: ColorBase.steelBlue,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${StringBase.walletBalance}: ${StringBase.currencySymbol}${balance.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 14,
                color: ColorBase.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2),
          ),
          GestureDetector(
            onTap: () {
              onAddMoney.call();
            },
            child: Container(
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: ColorBase.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: ColorBase.black)),
              child: const Center(
                child: Text(
                  StringBase.addMoney,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorBase.steelBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
