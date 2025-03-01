import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

import 'links.dart';
import 'meta.dart';

class MyOrders {
  List<P2pItem>? data;
  Links? links;
  Meta? meta;

  MyOrders({this.data, this.links, this.meta});

  factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => P2pItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
