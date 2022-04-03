import 'package:cryptop/views/account_passwrod_view/widgets/account_password_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../components/custom_top_bar/custom_top_bar.dart';
import '../../../components/text_component/text_component.dart';
import 'account_password_action.dart';

class AccountPasswordBody extends StatelessWidget {
  final Function? onClick;
  final Function? onChange;
  final Function? onSecure;
  final bool? editable;
  final bool? secure;
  final List<TextEditingController>? controllers;

  const AccountPasswordBody(
      {Key? key,
      this.secure,
      this.onClick,
      this.editable,
      this.onChange,
      this.controllers,
      this.onSecure})
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
                title: 'Password',
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
              editable! == true
                  ? IconButton(
                      onPressed: () => onSecure!(!secure!),
                      icon: Icon(
                        secure! == true
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  : Container(
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
                    ),
            ],
          ),
        ),
        AccountPasswordForm(
          secure: secure!,
          editable: editable!,
          onChange: onChange!,
          controllers: controllers,
        ),
        editable! == true
            ? AccountPasswordAction(
                editable: editable!,
                onClick: onClick,
              )
            : const SizedBox()
      ],
    );
  }
}
