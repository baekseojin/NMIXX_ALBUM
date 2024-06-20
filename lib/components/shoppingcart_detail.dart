import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingCartDetail extends StatefulWidget {
  final String title;
  final String description;

  const ShoppingCartDetail({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _ShoppingCartDetailState createState() => _ShoppingCartDetailState();
}

class _ShoppingCartDetailState extends State<ShoppingCartDetail> {
  bool _isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailDescription(),
            _buildDetailButton(context),
            if (_isAddedToCart) _buildAddedToCartMessage(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "50,000원", // Static price for demonstration
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailDescription() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        widget.description,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text("장바구니 추가하기"),
              content: const Text("이 앨범을 장바구니에 넣을까요?"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _isAddedToCart = true;
                    });
                  },
                  child: const Text(
                    "추가",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "취소",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: const Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "장바구니에 담기",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAddedToCartMessage() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "앨범이 카트에 담겼습니다!",
        style: TextStyle(color: Colors.green, fontSize: 16),
      ),
    );
  }
}
