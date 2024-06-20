import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  final Function(int) onIconSelected;

  const ShoppingCartHeader({Key? key, required this.onIconSelected}) : super(key: key);

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "ADMARE.png",
    "ENTWURF.jpg",
    "expergo.png",
    "Fe3O4BREAK.png", 
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, CupertinoIcons.airplane),
          _buildHeaderSelectorButton(1, CupertinoIcons.airplane),
          _buildHeaderSelectorButton(2, CupertinoIcons.airplane),
          _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
        ],
      ),
    );
  }

  Widget _buildHeaderSelectorButton(int id, IconData mIcon) {
    return Container(
      width: 70,
      height: 50,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          setState(() {
            selectedId = id;
          });
          widget.onIconSelected(id);
        },
      ),
    );
  }
}
