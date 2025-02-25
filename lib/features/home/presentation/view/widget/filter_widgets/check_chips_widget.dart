import 'package:flutter/material.dart';
import 'package:horsely_app/features/home/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_widgets/header_filter_section.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_widgets/shape_choose_iteam.dart';

import 'package:flutter/material.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_widgets/header_filter_section.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_widgets/shape_choose_iteam.dart';

class CheckChipsWidget extends StatefulWidget {
  const CheckChipsWidget(
      {super.key,
      required this.title,
      required this.allChips,
      this.selectedIds = const [],
      required this.onSelected});

  final String title;
  final List<ChipData>? allChips;
  final List<int> selectedIds;
  final Function(int) onSelected;

  @override
  _CheckChipsWidgetState createState() => _CheckChipsWidgetState();
}

class _CheckChipsWidgetState extends State<CheckChipsWidget> {
  bool showAll = false;
  var visibleChips;
  @override
  void initState() {
    visibleChips = showAll
        ? widget.allChips ?? []
        : (widget.allChips?.take(4).toList() ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Limit the number of visible chips based on the showAll flag
    visibleChips = showAll
        ? widget.allChips ?? []
        : (widget.allChips?.take(4).toList() ?? []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderFilterSection(
          titeel: widget.title,
          showAll: showAll,
          onPressed: () {
            setState(() {
              showAll = !showAll;
            });
          },
        ),
        const SizedBox(height: 16),
        Wrap(
            children: List.generate(
                visibleChips.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: ShapeChoose(
                            onSelected: (i) {
                              widget.onSelected(i);
                              setState(() {});
                            },
                            id: visibleChips[index].id,
                            titel: visibleChips[index].name,
                            isSelected: widget.selectedIds
                                .contains(visibleChips[index].id),
                          )),
                    ))),
        // if ((widget.allChips?.length ?? 0) > 4)
        //   GestureDetector(
        //     onTap: () {},
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 8.0),
        //       child: Text(
        //         showAll ? 'Show Less' : 'Show More',
        //         style: const TextStyle(
        //             color: Colors.blue, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}

class ChipData {
  final String name;
  final bool isSelected;
  final int id;
  ChipData({required this.name, this.isSelected = true, required this.id});
  static List<ChipData> chipDataFromCryptoCurrencyModel(
      CryptoCurrencyModel model) {
    return model.data
            ?.map((e) => ChipData(name: e.name!, id: e.id!))
            .toList() ??
        [];
  }

  static List<ChipData> chipDataFromAllCurrency(AllCurrencyModel model) {
    return model.data
            ?.map((e) => ChipData(name: e.name!, id: e.id!))
            .toList() ??
        [];
  }

  static List<ChipData> chipDataFromAllPayment(AllPaymentMethod model) {
    return model.data
            ?.map((e) => ChipData(name: e.name!, id: e.id!))
            .toList() ??
        [];
  }
}
