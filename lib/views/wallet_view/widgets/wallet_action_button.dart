import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:flutter/material.dart';

class WalletActionButton extends StatelessWidget {
  const WalletActionButton({
    Key? key,
    this.deposit,
    this.withdraw,
    this.transfer,
  }) : super(key: key);
  final Function? deposit;
  final Function? withdraw;
  final Function? transfer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonColor: Colors.amber,
          buttonText: 'Deposit',
          buttonTextColor: Colors.white,
          fontSize: 14.0,
          hasImage: false,
          height: 30.0,
          horizontal: 20.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () => {},
        ),
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonColor: Colors.grey,
          buttonText: 'Withdraw',
          buttonTextColor: Colors.white,
          fontSize: 14.0,
          hasImage: false,
          height: 30.0,
          horizontal: 20.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () => {},
        ),
        CustomButtom(
          borderColor: Colors.transparent,
          borderRadius: 5.0,
          buttonColor: Colors.grey,
          buttonText: 'Transfer',
          buttonTextColor: Colors.white,
          fontSize: 14.0,
          hasImage: false,
          height: 30.0,
          horizontal: 20.0,
          vertical: 4.0,
          imageUrl: '',
          onTap: () => {},
        ),
      ],
    );
  }
}
