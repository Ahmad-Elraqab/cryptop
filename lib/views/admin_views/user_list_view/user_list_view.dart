import 'package:cryptop/app/const.dart';
import 'package:cryptop/components/custom_buttom/custom_button.dart';
import 'package:cryptop/components/loading_animation/loading_animation.dart';
import 'package:cryptop/components/text_component/text_component.dart';
import 'package:cryptop/components/title_header/title_header.dart';
import 'package:cryptop/viewmodels/user_viewmodel/user_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final data = watch(getUsersAction).data?.value;
          return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(55, 61, 76, 1),
            child: data == null
                ? LoadingAnimation()
                : Column(
                    children: [
                      TitleHeader(isTitle: true, title: 'Users List'),
                      SizedBox(height: 50),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) => Container(
                              // height: 30,
                              margin: const EdgeInsets.only(bottom: 30.0),
                              padding: const EdgeInsets.only(bottom: 15.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.white),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextComponent(
                                    align: TextAlign.start,
                                    fontSize: 12,
                                    line: 1,
                                    textColor: Colors.white,
                                    title: data[index].name,
                                    weight: FontWeight.w800,
                                  ),
                                  Row(
                                    children: [
                                      CustomButtom(
                                        borderColor: Colors.transparent,
                                        borderRadius: 5,
                                        buttonColor: Colors.blueGrey,
                                        buttonText: 'Wallet',
                                        buttonTextColor: Colors.white,
                                        fontSize: 12,
                                        hasImage: false,
                                        horizontal: 20,
                                        imageUrl: '',
                                        height: 30,
                                        onTap: () => Navigator.pushNamed(
                                            context, rSystemWallet, arguments: {
                                          'wallet': data[index].wallet
                                        }),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      CustomButtom(
                                        borderColor: Colors.transparent,
                                        borderRadius: 5,
                                        buttonColor: Colors.blueGrey,
                                        buttonText: 'View',
                                        buttonTextColor: Colors.white,
                                        fontSize: 12,
                                        hasImage: false,
                                        horizontal: 20,
                                        imageUrl: '',
                                        height: 30,
                                        onTap: () => Navigator.pushNamed(
                                            context, rUserView,
                                            arguments: {'user': data[index]}),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
