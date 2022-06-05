import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/models/alert_model.dart';
import 'package:cryptop/views/alert_view/widgets/alert_header.dart';
import 'package:cryptop/views/alert_view/widgets/alert_list.dart';
import 'package:flutter/material.dart';

class AlertBody extends StatelessWidget {
  const AlertBody({
    Key? key,
    this.activeIndex,
    this.setIndex,
    this.alerts,
  }) : super(key: key);
  final int? activeIndex;
  final Function? setIndex;
  final List<Alert>? alerts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        const TitleHeader(
          isTitle: true,
          title: 'Alerts',
        ),
        const SizedBox(height: 20.0),
        AlertHeader(),
        alerts == null
            ? LoadingAnimation()
            : alerts!.isEmpty
                ? Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image.asset('lib/assets/logo.png'),
                      ),
                    ),
                  )
                : AlertList(
                    activeIndex: activeIndex,
                    setIndex: setIndex,
                    alerts: alerts,
                  ),
      ],
    );
  }
}
