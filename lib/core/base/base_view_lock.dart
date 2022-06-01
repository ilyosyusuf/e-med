import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get_storage/get_storage.dart';

class BaseViewLock<T> extends StatefulWidget {
  final T? viewModel;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseViewLock({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  @override
  State<BaseViewLock> createState() => _BaseViewLockState();
}

class _BaseViewLockState extends State<BaseViewLock> with WidgetsBindingObserver {
  var subscription;
  var internetStatus;

  int _timerCounter = 0;
  Timer? _timer;

  void _incrementTimerCounter(Timer t) {
    print("TimerCounter: $_timerCounter");
    if (_timerCounter >= 30) {
      _timer!.cancel();
      GetStorage().write("isLock", true);
    }
    _timerCounter += 1;
    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // _timer = Timer(const Duration(microseconds: 1), () {});

    if (state == AppLifecycleState.resumed) {
      _timerCounter = 0;
      debugPrint("Resume!");
      _timer!.cancel();
    }
    if (state == AppLifecycleState.inactive) return;
    if (state == AppLifecycleState.paused) {
      _timer = Timer.periodic(
          const Duration(milliseconds: 300), _incrementTimerCounter);
    }
    if (state == AppLifecycleState.detached) {
      GetStorage().write("isLock", true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    GetStorage().write("isLock", false);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        internetStatus = result;
      });
    });
    if (widget.onModelReady != null){
widget.onModelReady!(widget.viewModel);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return returnPage();
  }

  Widget returnPage() {
    if (internetStatus == ConnectivityResult.none) {
      return Scaffold(
        body: Center(
          child: Text("No Internet"),
        ),
      );
    } else {
      if (!GetStorage().read("isLock")) {
        return widget.onPageBuilder!(context, widget.viewModel);
      } else {
        return ScreenLock(
            correctString: '1234',
            // canCancel: false,
            didUnlocked: () {
              setState(() {});
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            },
            didConfirmed: (pin) {
              setState(() {
                GetStorage().write("isLock", false);
                _timerCounter = 0;
              });
            },
            screenLockConfig: ScreenLockConfig(backgroundColor: Colors.white),
            secretsConfig: SecretsConfig(
              spacing: 15,
              padding: EdgeInsets.all(40),
              secretConfig: SecretConfig(
                borderColor: Colors.blue,
                borderSize: 2.0,
                disabledColor: Colors.white,
                enabledColor: Colors.blue,
                height: 15,
                width: 15,
                build: (context,
                    {required SecretConfig config, required bool enabled}) {
                  return SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: enabled
                              ? config.enabledColor
                              : config.disabledColor,
                          border: Border.all(
                            width: config.borderSize,
                            color: config.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(10),
                      width: config.width,
                      height: config.height,
                    ),
                    width: config.width,
                    height: config.height,
                  );
                },
              ),
            ),
            inputButtonConfig: InputButtonConfig(
              textStyle:
                  InputButtonConfig.getDefaultTextStyle(context).copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              buttonStyle: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.white),
            ),
            cancelButton: const Icon(Icons.close),
            deleteButton: const Icon(Icons.delete));
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (widget.onDispose != null) widget.onDispose!();
    _timer!.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
