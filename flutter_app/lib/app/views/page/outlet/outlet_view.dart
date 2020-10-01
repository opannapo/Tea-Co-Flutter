import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;
import 'package:flutter_app/app/utils/extensions.dart';
import 'package:flutter_app/app/utils/page_route.dart';
import 'package:flutter_app/app/viewmodel/outlet/outlet_vm.dart';
import 'package:flutter_app/app/viewmodel/outlets/outlets_vm.dart';
import 'package:flutter_app/app/views/components/UIText.dart';
import 'package:flutter_app/app/views/components/custom_dialog.dart';
import 'package:flutter_app/app/views/components/list/click_listener.dart';
import 'package:flutter_app/app/views/components/list/list_catalogs_grid.dart';
import 'package:flutter_app/app/views/page/catalog/catalogs_view.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OutletView extends StatefulWidget {
  final Outlets entity;
  final String heroTag;

  const OutletView(this.entity, this.heroTag, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OutletViewState();
}

class OutletViewState extends State<OutletView>
    with TickerProviderStateMixin, CatalogItemClickListener {
  final keyScaffoldState = new GlobalKey<ScaffoldState>();
  final OutletViewModel vm = new OutletViewModel();

  Outlets get entity => widget.entity;

  OutletViewState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => onBuildComplete(context));
  }

  @override
  void initState() {
    super.initState();
    print(DotEnv().env['BASE_URL']);
  }

  Future<void> onBuildComplete(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 1000));
    vm.doSetupDataCatalog(entity.id);
    vm.currentState.listen((event) {
      if (event == OutletsViewModel.STATE_LOADING) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CustomDialog.dialogLoading('Catalogs');
            });
      } else {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      }
    });
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: keyScaffoldState,
        resizeToAvoidBottomPadding: false,
        appBar: _appBar(),
        body: Container(
          color: Constants.Colors.BASE,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                _header(),
                Divider(height: 10, color: Colors.transparent),
                _listContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Container(
        color: Colors.transparent,
        width: context.widthFull(),
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_left,
                  color: Constants.Colors.TEXT_BLACK,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'icon-splash',
                    child: Container(
                      child: Image(
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                        color: Constants.Colors.TEXT_BLACK,
                        image: new AssetImage(
                          Constants.Assets.OPANNAPO_500,
                        ),
                      ),
                    ),
                  ),
                  UIText.mediumAlignLeft(
                    text: ' opannapo.tea&co',
                    isBold: true,
                    letterSpacing: 2,
                    color: Constants.Colors.TEXT_BLACK,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Hero(
      tag: widget.heroTag,
      child: Material(
        child: Card(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          color: Constants.Colors.BASE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1),
              bottomRight: Radius.circular(1),
              bottomLeft: Radius.circular(1),
              topRight: Radius.circular(1),
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  color: Constants.Colors.TEXT_BLACK,
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
                                  text: entity.is_active
                                      ? ' ACTIVE'
                                      : ' INACTIVE',
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
      ),
    );
  }

  Widget _listContent() {
    return Container(
      child: StreamBuilder<List<Catalog>>(
        stream: vm.listContent,
        initialData: [],
        builder: (context, snapshot) {
          var data = snapshot.data;
          return GridView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: (3 / 4),
            ),
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, idx) {
              Catalog entity = data[idx];
              return Hero(
                tag: 'catalog-detail-${entity.id}',
                child: Material(
                  child: ListCatalogGridItem.content(entity, this),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void onClick(Catalog data) {
    Navigator.of(context).push(new PageRouteFade(
        new CatalogsView(data, "catalog-detail-${data.id}"), 500));
  }
}
