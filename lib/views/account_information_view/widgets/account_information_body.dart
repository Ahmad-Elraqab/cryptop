import 'package:cryptop/components/custom_top_bar/custom_top_bar.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/views/account_information_view/widgets/account_information_form.dart';
import 'package:flutter/material.dart';
import 'account_information_action.dart';

class AccountInformationBody extends StatelessWidget {
  final Function? onClick;
  final Function? onChange;
  final bool? editable;
  final List<TextEditingController>? controllers;

  const AccountInformationBody(
      {Key? key, this.onClick, this.editable, this.onChange, this.controllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTopBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextComponent(
                fontSize: 16.0,
                line: 1,
                textColor: Colors.white,
                title: 'Account Information',
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
              editable! == true
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: IconButton(
                        onPressed: () => onClick!(!editable!),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
        AccountInformationForm(
          editable: editable!,
          onChange: onChange!,
          controllers: controllers,
        ),
        !editable!
            ? AccountInformationAction(
                editable: editable!,
                onClick: onClick!,
              )
            : const SizedBox()
      ],
    );
  }
}
