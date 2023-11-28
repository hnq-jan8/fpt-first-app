import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/theme/theme_colors.dart';

class FAQSearchBox extends StatefulWidget {
  const FAQSearchBox({
    super.key,
    required TextEditingController? searchController,
    this.onChanged,
  }) : _searchController = searchController;

  final TextEditingController? _searchController;

  final Function(String)? onChanged;

  @override
  State<FAQSearchBox> createState() => _FAQSearchBoxState();
}

class _FAQSearchBoxState extends State<FAQSearchBox> {
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 5,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColors.primaryBlue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              StringConst.get(context)!.nhapTuKhoa,
              style: const TextStyle(
                color: ThemeColors.onPrimary,
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            child: TextField(
              onChanged: widget.onChanged,
              onTap: widget._searchController != null
                  ? () => widget._searchController!.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: widget._searchController!.text.length,
                      )
                  : null,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              controller: widget._searchController,
              focusNode: searchFocusNode,
              style: TextStyle(
                color: searchFocusNode.hasFocus
                    ? ThemeColors.onBackground
                    : ThemeColors.onPrimary,
                fontSize: 14.5,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                fillColor: searchFocusNode.hasFocus
                    ? ThemeColors.background
                    : Colors.white30,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
