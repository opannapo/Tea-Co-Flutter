import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;
import 'package:flutter_app/models/outlets.dart';

import '../UIText.dart';
import 'click_listener.dart';

class ListOutletsItem {
  static Widget content(
      Outlets entity, OutletsItemClickListener clickListener) {
    return Card(
      margin: EdgeInsets.fromLTRB(25, 5, 25, 20),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      color: Constants.Colors.TEXT_BLACK,
      child: GestureDetector(
        onTap: () => clickListener.onClick(entity),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.base(
                      isBold: true,
                      size: 16,
                      color: Constants.Colors.GOLD_1,
                      text: entity.outlet_name,
                    ),
                    Divider(height: 10, color: Colors.transparent),
                    UIText.base(
                      isBold: false,
                      size: 12,
                      color: Constants.Colors.WHITE_GRAY_SOFT,
                      text: entity.address,
                    ),
                  ],
                ),
              ),
              Divider(height: 10, color: Colors.transparent),
              Container(
                color: Constants.Colors.BASE,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                entity.is_closed
                                    ? Icons.timer_off
                                    : Icons.access_time,
                                size: 14,
                                color: entity.is_closed
                                    ? Constants.Colors.TEXT_BLACK_SOFT
                                    : Colors.green,
                              ),
                              UIText.base(
                                isBold: false,
                                size: 14,
                                color: entity.is_closed
                                    ? Constants.Colors.TEXT_BLACK_SOFT
                                    : Colors.green,
                                text: entity.is_closed ? ' CLOSE' : ' OPEN',
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 14,
                                color: entity.is_active
                                    ? Colors.green
                                    : Constants.Colors.TEXT_BLACK_SOFT,
                              ),
                              UIText.base(
                                isBold: false,
                                size: 14,
                                color: entity.is_active
                                    ? Colors.green
                                    : Constants.Colors.TEXT_BLACK_SOFT,
                                text:
                                    entity.is_active ? ' ACTIVE' : ' INACTIVE',
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 14,
                                color: entity.can_delivery
                                    ? Colors.green
                                    : Constants.Colors.TEXT_BLACK_SOFT,
                              ),
                              UIText.base(
                                isBold: false,
                                size: 14,
                                color: entity.can_delivery
                                    ? Colors.green
                                    : Constants.Colors.TEXT_BLACK_SOFT,
                                text: ' DELIVERY',
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.business_center,
                                size: 14,
                                color: entity.can_pickup
                                    ? Colors.green
                                    : Constants.Colors.TEXT_BLACK_SOFT,
                              ),
                              UIText.base(
                                isBold: false,
                                size: 14,
                                color: entity.can_pickup
                                    ? Colors.green
                                    : Constants.Colors.TEXT_BLACK_SOFT,
                                text: ' PICKUP',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                        height: 20, color: Constants.Colors.WHITE_GRAY_SOFT),
                    UIText.base(
                      isBold: true,
                      size: 16,
                      color: Constants.Colors.TEXT_BLACK,
                      text: 'Delivery Services ',
                    ),
                    Divider(height: 10, color: Constants.Colors.BASE),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: UIText.base(
                            isBold: true,
                            size: 14,
                            color: Constants.Colors.TEXT_BLACK,
                            text: "Weekdays ",
                          ),
                        ),
                        UIText.base(
                          isBold: false,
                          size: 14,
                          color: Constants.Colors.TEXT_BLACK,
                          text:
                              "${entity.first_delivery_now_order_weekday} - ${entity.last_delivery_order_weekday}",
                        ),
                      ],
                    ),
                    Divider(height: 5, color: Constants.Colors.BASE),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: UIText.base(
                            isBold: true,
                            size: 14,
                            color: Constants.Colors.TEXT_BLACK,
                            text: "Weekend ",
                          ),
                        ),
                        UIText.base(
                          isBold: false,
                          size: 14,
                          color: Constants.Colors.TEXT_BLACK,
                          text:
                              "${entity.first_delivery_now_order_weekend} - ${entity.last_delivery_order_weekend}",
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      color: Constants.Colors.WHITE_GRAY_SOFT,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 16,
                                color: entity.is_closed
                                    ? Constants.Colors.TEXT_BLACK_SOFT
                                    : Colors.green,
                              ),
                              UIText.base(
                                isBold: false,
                                size: 16,
                                color: Colors.green,
                                text: 'CALL',
                              )
                            ],
                          ),
                        ),
                        VerticalDivider(
                          indent: 2,
                          color: Colors.red,
                          width: 2,
                          thickness: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: entity.is_closed
                                    ? Constants.Colors.TEXT_BLACK_SOFT
                                    : Colors.green,
                              ),
                              UIText.base(
                                isBold: false,
                                size: 16,
                                color: Colors.green,
                                text: 'LOCATION',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
