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
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]
        ),
        child: ExpandablePanel(
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          header,
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff342861),
                              fontWeight: FontWeight.bold
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
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0),
            child: Text(
                expanded,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
