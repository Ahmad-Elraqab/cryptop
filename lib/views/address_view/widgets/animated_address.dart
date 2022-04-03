import 'package:cryptop/views/address_view/widgets/address_addition.dart';
import 'package:cryptop/views/address_view/widgets/address_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AnimatedAddress extends StatelessWidget {
  const AnimatedAddress({
    Key? key,
    this.setCheck,
    this.top,
    this.check,
    this.setTop,
    this.markers,
    this.setId,
    this.titleController,
    this.descriptionController,
    this.setTitle,
    this.setDescription,
    this.add,
    this.delete,
    this.edit,
  }) : super(key: key);

  final Function? setCheck;
  final Function? setTitle;
  final Function? setDescription;
  final Function? add;
  final Function? delete;
  final Function? edit;
  final bool? top;
  final bool? check;
  final Function? setTop;
  final Map<MarkerId, Marker>? markers;
  final Function? setId;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;

  List<AddressLine> displayAddress() {
    List<AddressLine> list = [];
    final keys = markers!.keys.toList();

    for (var i = 0; i < markers!.length; i++) {
      if (markers![keys[i]]!.markerId.value != 'center') {
        list.add(
          AddressLine(
            index: markers![keys[i]]!.markerId.value,
            onClick: setId!,
            delete: delete,
            edit: edit,
            title: markers![keys[i]]!.infoWindow.title,
            snippet: markers![keys[i]]!.infoWindow.snippet,
            setTitle: setTitle,
            setDescription: setDescription,
            titleController: titleController,
            descriptionController: descriptionController,
          ),
        );
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      onEnd: () {
        setCheck!(true);
        setCheck!(false);
      },
      top: top! == false ? MediaQuery.of(context).size.height - 200 : 200,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onVerticalDragUpdate: (details) => {
          if (details.delta.dy > 45 || details.delta.dy < -45)
            if (check! == false) setTop!(!top!),
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => {
                    showBottomSheet(
                      context: context,
                      builder: (context) => AddressAddition(
                        titleController: titleController,
                        descriptionController: descriptionController,
                        setDescription: setDescription,
                        setTitle: setTitle,
                        add: add,
                      ),
                    ),
                  },
                  backgroundColor: const Color.fromRGBO(36, 36, 43, 1),
                  child: const Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.add,
                    size: 16,
                  ),
                ),
              ),
              Column(
                children: displayAddress(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
