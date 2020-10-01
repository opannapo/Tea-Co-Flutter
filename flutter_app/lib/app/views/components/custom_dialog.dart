import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;

class CustomDialog {
  static Widget dialogLoading(String msg) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xEEffffff),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            backgroundColor: Constants.Colors.GOLD_1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            backgroundColor: Constants.Colors.GOLD_1,
                          ),
                        ),
                      ],
                    )),
                Container(height: 10),
                Text(
                  "$msg",
                  style: TextStyle(
                      color: Constants.Colors.TEXT_BLACK, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
