import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:deliveryapp/src/components.dart';
import 'package:deliveryapp/src/config.dart';
import 'package:flutter/material.dart';

void showToast({

  required String msg,
  bool isError = false,
  bool isNeutralMessage = false,
  VoidCallback? onDismiss,
}) async {
  const toastDuration = Duration(seconds: 2);
  var cancelFunc = BotToast.showAttachedWidget(
    target: const Offset(-16, -16),
    verticalOffset: 10.0,
    horizontalOffset: 4.0,
   
    duration: toastDuration,
    animationDuration: const Duration(seconds: 2),
    preferDirection: PreferDirection.topRight,
    onlyOne: false,
    attachedBuilder: (cancel) {
      return AlertBody(cancel: cancel, msg: msg, isError: isError);
    },
  );
  Future.delayed(toastDuration).then((_) {
    cancelFunc();
    onDismiss?.call();
  });
}

class AlertBody extends StatefulWidget {
  final VoidCallback cancel;
  final String msg;
  final bool isError;
final bool isNeutralMessage;
  const AlertBody(
      {super.key,
      required this.cancel,
      required this.msg,
      this.isError = false,
      this.isNeutralMessage = false});

  @override
  State<AlertBody> createState() => _AlertBodyState();
}

class _AlertBodyState extends State<AlertBody> with SingleTickerProviderStateMixin {


  AnimationController? _animationController;
  Animation<double>? animation;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    init();

    super.didChangeDependencies();
  }

  init() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 5.0, end: 0.0).animate(_animationController!)
      ..addListener(() {
        initAnt();
      });

    _animationController!.forward();
  }

  Future<void> initAnt() async {
    setState(() {
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Stack(
        children: [
          //Green or Red container.
          Container(
            decoration: BoxDecoration(
              color: widget.isError ? Colors.red : AppColors.kVerdantBreeze,
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 56.h,
            width: 335.w,
          ),
          Positioned(
            left: 3.w,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kGrey200,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0, 16),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                ],
              ),
              height: 56.h,
              width: 335.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageView.asset(AppImages.checkCircleIcon, width: 24.w, height: 24.h),
                  SizedBox(
                    width: 250.w,
                    child: TextView(
                      text: widget.msg,
                      color: AppColors.kGrey700,
                      fontSize: 14.spMin,
                      maxLines: 3,
                      fontFamily: sfPro,
                      height: (20 / 14).h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.kGrey700, size: 24.spMin),
                    onPressed: widget.cancel,
                  )
                ],
              ),
            ),
          ),
         
        ]
      ),
    );
  }
}