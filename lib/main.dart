import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: const ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int _selectedId = 0;

  final List<String> _titles = [
    "AD MARE",
    "ENTWURF",
    "EXPERGO",
    "Fe3O4 : BREAK",
  ];

  final List<String> _descriptions = [
    "걸그룹의 새로운 시대를 여는 JYP 엔터테인먼트의 신예 NMIXX. 수록곡 : O.O(TITLE), TANK",
    "다양한 장르를 한 곡에 담은 믹스팝을 선보이는 NMIXX의 싱글.  수록곡 : DICE(TITLE), COOL",
    "톡톡 튀는 믹스 팝을 선보이는 NMIXX의 첫 미니 앨범.                    수록곡 : Love Me Like This(TITLE), PAXXWORD, Just Did it 등",
    "힘 있는 사운드, 끊임없는 변주와 함께 새로운 세계로 거침없이 나아가는 NMIXX의 미니 2집.                                                                               수록곡 : DASH, Soñar, Run For Roses, BOOM, Passionfruit 등",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(
            onIconSelected: (index) {
              setState(() {
                _selectedId = index;
              });
            },
          ),
          Expanded(
            child: ShoppingCartDetail(
              title: _titles[_selectedId],
              description: _descriptions[_selectedId],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }
}
