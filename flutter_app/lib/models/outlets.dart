import 'package:json_annotation/json_annotation.dart';

part 'outlets.g.dart';

@JsonSerializable()
class Outlets {
    Outlets();

    num id;
    String outlet_name;
    String phone_1;
    String phone_2;
    String photo_1;
    String photo_2;
    String photo_3;
    String photo_4;
    String note;
    String description;
    String longitude;
    String latitude;
    String address;
    num district_id;
    String moka_id;
    String moka_sync_at;
    bool is_active;
    bool is_closed;
    String first_app_order;
    String last_app_order;
    String first_app_order_weekday;
    String last_app_order_weekday;
    String first_app_order_weekend;
    String last_app_order_weekend;
    num max_delivery_radius;
    bool can_pickup;
    bool can_delivery;
    bool can_delivery_now;
    String first_delivery_now_order;
    String last_delivery_order;
    String first_delivery_now_order_weekday;
    String last_delivery_order_weekday;
    String first_delivery_now_order_weekend;
    String last_delivery_order_weekend;
    bool delivery_notification;
    String delivery_notification_recipient;
    String last_delivery_notification_sent;
    String created_at;
    String updated_at;
    String deleted_at;
    
    factory Outlets.fromJson(Map<String,dynamic> json) => _$OutletsFromJson(json);
    Map<String, dynamic> toJson() => _$OutletsToJson(this);
}
