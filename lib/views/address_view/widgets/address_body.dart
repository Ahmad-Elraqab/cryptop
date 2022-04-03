import 'package:cryptop/components/custom_top_bar/custom_top_bar.dart';
import 'package:cryptop/views/address_view/widgets/animated_address.dart';
import 'package:cryptop/views/address_view/widgets/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({
    Key? key,
    this.markers,
    this.setTop,
    this.top,
    this.id,
    this.setId,
    this.check,
    this.setCheck,
    this.onChange,
    this.setCenter,
    this.controller,
    this.setController,
    this.titleController,
    this.descriptionController,
    this.setTitle,
    this.setDescription,
    this.add,
    this.edit,
    this.delete,
  }) : super(key: key);

  final Function? setTop;
  final Function? setTitle;
  final Function? onChange;
  final Function? setController;
  final Function? setId;
  final Function? setCheck;
  final Function? setCenter;
  final Function? delete;
  final Function? add;
  final Function? edit;
  final Function? setDescription;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Map<MarkerId, Marker>? markers;
  final bool? top;
  final bool? check;
  final GoogleMapController? controller;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GMap(
          markers: markers!,
          setController: setController!,
          id: id!,
          setCenter: setCenter!,
          controller: controller,
        ),
        const CustomTopBar(
          buttonColor: Colors.white,
          background: Color.fromRGBO(36, 36, 43, 1),
        ),
        AnimatedAddress(
          setCheck: setCheck,
          top: top,
          check: check,
          setDescription: setDescription,
          setTitle: setTitle,
          setTop: setTop,
          markers: markers,
          setId: setId,
          titleController: titleController,
          descriptionController: descriptionController,
          add: add,
          delete: delete,
          edit: edit,
        )
      ],
    );
  }
}
