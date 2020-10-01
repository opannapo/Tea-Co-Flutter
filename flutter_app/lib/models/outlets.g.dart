// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Outlets _$OutletsFromJson(Map<String, dynamic> json) {
  return Outlets()
    ..id = json['id'] as num
    ..outlet_name = json['outlet_name'] as String
    ..phone_1 = json['phone_1'] as String
    ..phone_2 = json['phone_2'] as String
    ..photo_1 = json['photo_1'] as String
    ..photo_2 = json['photo_2'] as String
    ..photo_3 = json['photo_3'] as String
    ..photo_4 = json['photo_4'] as String
    ..note = json['note'] as String
    ..description = json['description'] as String
    ..longitude = json['longitude'] as String
    ..latitude = json['latitude'] as String
    ..address = json['address'] as String
    ..district_id = json['district_id'] as num
    ..moka_id = json['moka_id'] as String
    ..moka_sync_at = json['moka_sync_at'] as String
    ..is_active = json['is_active'] as bool
    ..is_closed = json['is_closed'] as bool
    ..first_app_order = json['first_app_order'] as String
    ..last_app_order = json['last_app_order'] as String
    ..first_app_order_weekday = json['first_app_order_weekday'] as String
    ..last_app_order_weekday = json['last_app_order_weekday'] as String
    ..first_app_order_weekend = json['first_app_order_weekend'] as String
    ..last_app_order_weekend = json['last_app_order_weekend'] as String
    ..max_delivery_radius = json['max_delivery_radius'] as num
    ..can_pickup = json['can_pickup'] as bool
    ..can_delivery = json['can_delivery'] as bool
    ..can_delivery_now = json['can_delivery_now'] as bool
    ..first_delivery_now_order = json['first_delivery_now_order'] as String
    ..last_delivery_order = json['last_delivery_order'] as String
    ..first_delivery_now_order_weekday =
        json['first_delivery_now_order_weekday'] as String
    ..last_delivery_order_weekday =
        json['last_delivery_order_weekday'] as String
    ..first_delivery_now_order_weekend =
        json['first_delivery_now_order_weekend'] as String
    ..last_delivery_order_weekend =
        json['last_delivery_order_weekend'] as String
    ..delivery_notification = json['delivery_notification'] as bool
    ..delivery_notification_recipient =
        json['delivery_notification_recipient'] as String
    ..last_delivery_notification_sent =
        json['last_delivery_notification_sent'] as String
    ..created_at = json['created_at'] as String
    ..updated_at = json['updated_at'] as String
    ..deleted_at = json['deleted_at'] as String;
}

Map<String, dynamic> _$OutletsToJson(Outlets instance) => <String, dynamic>{
      'id': instance.id,
      'outlet_name': instance.outlet_name,
      'phone_1': instance.phone_1,
      'phone_2': instance.phone_2,
      'photo_1': instance.photo_1,
      'photo_2': instance.photo_2,
      'photo_3': instance.photo_3,
      'photo_4': instance.photo_4,
      'note': instance.note,
      'description': instance.description,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'address': instance.address,
      'district_id': instance.district_id,
      'moka_id': instance.moka_id,
      'moka_sync_at': instance.moka_sync_at,
      'is_active': instance.is_active,
      'is_closed': instance.is_closed,
      'first_app_order': instance.first_app_order,
      'last_app_order': instance.last_app_order,
      'first_app_order_weekday': instance.first_app_order_weekday,
      'last_app_order_weekday': instance.last_app_order_weekday,
      'first_app_order_weekend': instance.first_app_order_weekend,
      'last_app_order_weekend': instance.last_app_order_weekend,
      'max_delivery_radius': instance.max_delivery_radius,
      'can_pickup': instance.can_pickup,
      'can_delivery': instance.can_delivery,
      'can_delivery_now': instance.can_delivery_now,
      'first_delivery_now_order': instance.first_delivery_now_order,
      'last_delivery_order': instance.last_delivery_order,
      'first_delivery_now_order_weekday':
          instance.first_delivery_now_order_weekday,
      'last_delivery_order_weekday': instance.last_delivery_order_weekday,
      'first_delivery_now_order_weekend':
          instance.first_delivery_now_order_weekend,
      'last_delivery_order_weekend': instance.last_delivery_order_weekend,
      'delivery_notification': instance.delivery_notification,
      'delivery_notification_recipient':
          instance.delivery_notification_recipient,
      'last_delivery_notification_sent':
          instance.last_delivery_notification_sent,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at
    };
