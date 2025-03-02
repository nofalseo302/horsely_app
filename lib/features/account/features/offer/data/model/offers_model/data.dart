import 'offers.dart';

class Data {
  int? counts;
  Offers? offers;

  Data({this.counts, this.offers});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        counts: json['counts'] as int?,
        offers: json['offers'] == null
            ? null
            : Offers.fromJson(json['offers'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'counts': counts,
        'offers': offers?.toJson(),
      };
}
