import 'package:flutter/material.dart';

import 'package:task_app/resources/colors.dart';
import 'package:task_app/resources/strings.dart';

class WalletBalanceCard extends StatelessWidget {
  final double balance;
  final Function onAddMoney;

  const WalletBalanceCard(
      {Key? key, required this.balance, required this.onAddMoney})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: ColorBase.steelBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(
            Icons.account_balance_wallet,
            color: ColorBase.steelBlue,
          ),
          Text(
            '${StringBase.walletBalance}: ${StringBase.currencySymbol}${balance.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 12,
                color: ColorBase.steelBlue,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              onAddMoney.call();
            },
            child: Container(
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: ColorBase.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: ColorBase.black)),
              child: const Center(
                child: Text(
                  StringBase.addMoney,
                  style: TextStyle(
                    fontSize: 10,
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
