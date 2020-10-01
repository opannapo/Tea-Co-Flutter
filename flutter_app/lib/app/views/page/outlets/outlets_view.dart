import 'package:flutter/material.dart';
import 'package:flutter_app/app/utils/constant.dart' as Constants;
import 'package:flutter_app/app/utils/extensions.dart';
import 'package:flutter_app/app/utils/page_route.dart';
import 'package:flutter_app/app/viewmodel/outlets/outlets_vm.dart';
import 'package:flutter_app/app/views/components/UIText.dart';
import 'package:flutter_app/app/views/components/custom_dialog.dart';
import 'package:flutter_app/app/views/components/list/click_listener.dart';
import 'package:flutter_app/app/views/components/list/list_outlets.dart';
import 'package:flutter_app/app/views/page/outlet/outlet_view.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OutletsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OutletsViewState();
}

class OutletsViewState extends State<OutletsView>
    with TickerProviderStateMixin, OutletsItemClickListener {
  final keyScaffoldState = new GlobalKey<ScaffoldState>();
  final OutletsViewModel vm = new OutletsViewModel();
  final EdgeInsets _eMarginMainCard = EdgeInsets.fromLTRB(80, 0, 20, 5);

  OutletsViewState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => onBuildComplete(context));
  }

  @override
  void initState() {
    super.initState();
    vm.doSetupData();

    print(DotEnv().env['BASE_URL']);
  }

  Future<void> onBuildComplete(BuildContext context) async {
    vm.currentState.listen((event) {
      if (event == OutletsViewModel.STATE_LOADING) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CustomDialog.dialogLoading('Outlets');
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
      color: Constants.Colors.WHITE_GRAY_SOFT,
      child: Scaffold(
        key: keyScaffoldState,
        appBar: _appBar(),
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Constants.Colors.WHITE_GRAY_SOFT,
          width: context.widthFull(),
          height: context.heightFull(),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: _listContent(),
              ),
            ],
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

  Widget _listContent() {
    return Container(
      child: StreamBuilder<List<Outlets>>(
        stream: vm.listOutlets,
        initialData: [],
        builder: (context, snapshot) {
          var data = snapshot.data;
          return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, idx) {
              Outlets entity = data[idx];
              return Hero(
                tag: 'outlet-detail-${entity.id}',
                child: Material(
                  child: ListOutletsItem.content(entity, this),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void onClick(Outlets data) {
    //_actionOpen(data);
    print("CLICK ${data.outlet_name}");
    Navigator.of(context).push(new PageRouteFade(
        new OutletView(data, "outlet-detail-${data.id}"), 500));
  }
}
