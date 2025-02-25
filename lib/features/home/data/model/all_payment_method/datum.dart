import 'package:horsely_app/features/account/features/payment_methods/data/model/paymentMethodModel.dart';

class DataPay {
  int? id;
  String? name;
  String? notes;
  String? image;
  bool? isDefault;
  List<Fields>? fields;

  DataPay(
      {this.id,
      this.name,
      this.notes,
      this.image,
      this.isDefault,
      this.fields});

  DataPay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notes = json['notes'];
    image = json['image'];
    isDefault = json['is_default'];
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['notes'] = notes;
    data['image'] = image;
    data['is_default'] = isDefault;
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
