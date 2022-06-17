import 'package:cryptop/views/admin_views/user_view/widgets/text_style.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final String? firstText;
  final Function? onTap;

  const ProfileInfoCard({
    Key? key,
    this.firstText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap!(),
        child: Card(
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(firstText!, style: titleStyle),
          )),
        ),
      ),
    );
  }
}
