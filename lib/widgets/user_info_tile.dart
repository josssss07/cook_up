import 'package:flutter/material.dart';
import 'package:cook_up/utils/AppColor.dart';

class UserInfoTile extends StatelessWidget {
  final String label, value;
  final EdgeInsetsGeometry margin, padding;
  final Color valueBackground;
  const UserInfoTile(
      {super.key, required this.label,
      required this.value,
      required this.padding,
      required this.margin,
      required this.valueBackground});

  @override
  Widget build(BuildContext context) {
    var primaryExtraSoft;
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(label,
                style: const TextStyle(color: Colors.amber, fontSize: 16)),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.amber,
                width: 0.5,
              ),
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            // color: valueBackground ?? AppColor.primarySoft,
            child: Text(value,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'inter',
                    color: Colors.amber)),
          )
        ],
      ),
    );
  }
}
