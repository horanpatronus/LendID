import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownGenerate extends StatefulWidget {
  final String title;
  final List<String> menuItems;

  const DropdownGenerate({
    Key? key,
    required this.title,
    required this.menuItems,
  }) : super(key: key);

  @override
  State<DropdownGenerate> createState() => _DropdownGenerateState();
}

class _DropdownGenerateState extends State<DropdownGenerate> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double dropdownWidth = constraints.maxWidth;

        return Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xffA1E3D8),
          ),
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: Stack(
                  children: [
                    DropdownButton2(
                      hint: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: widget.menuItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 40,
                        width: dropdownWidth,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                    if (selectedValue != null)
                      Positioned(
                        right: 20,
                        top: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedValue = null;
                            });
                          },
                          child: Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
