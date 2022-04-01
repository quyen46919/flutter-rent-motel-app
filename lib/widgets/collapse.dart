import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Collapse extends StatelessWidget {
  final String header;
  final String collapse;
  final String expanded;
  const Collapse({
    required this.header,
    required this.collapse,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade100,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
            ),
          ]
        ),
        child: ExpandablePanel(
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          header,
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromRGBO(13, 71, 161, 1),
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
          collapsed: const Text(''),
          expanded: Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0, top: 10.0),
            child: Text(
                expanded,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
