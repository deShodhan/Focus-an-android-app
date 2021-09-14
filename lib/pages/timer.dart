import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:stayfocused/database/taskmodel.dart';
import 'package:stayfocused/home_page/home.dart';
import 'package:stayfocused/pages/forest.dart';
import 'package:stayfocused/widgets/confitti.dart';
import 'package:stayfocused/widgets/custButton.dart';

class count_doenTimer extends StatefulWidget {
  @override
  _count_doenTimerState createState() => _count_doenTimerState();
}

class _count_doenTimerState extends State<count_doenTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appBar(),
      body: Container(
        height: 100.0.h,
        width: 100.0.w,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 15.0.h,
            ),
            _topText(context),
            SizedBox(
              height: 10.0.h,
            ),
            _countdownTimer(context),
            SizedBox(
              height: 10.0.h,
            ),
            _bottomText(context)
          ],
        ),
      ),
    );
  }

  Widget _countdownTimer(BuildContext context) {
    return CircularCountDownTimer(
      width: 55.0.w,
      height: 55.0.w,
      duration: 75,
      fillColor: Colors.green,
      ringColor: Colors.black,
      isReverse: true,
      //backgroundColor: Colors.grey[100],
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(fontSize: 17.0.w, fontWeight: FontWeight.bold),
      isTimerTextShown: false,
      autoStart: true,
      onStart: () {
        debugPrint("___________started");
      },
      onComplete: () {
        debugPrint('______________completed');
      },
    );
  }

  Widget _topText(BuildContext context) {
    return Text(
      "Plant now!",
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 15.0.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _bottomText(BuildContext context) {
    return Container(
      height: 10.0.h,
      width: 70.0.w,
      child: Text(
        "Stay away from your phone and your plant grows!",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 15.0.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/*----------------------------------------------test timer-----------------------------------*/

class timerPage extends StatefulWidget {
  final int duration;
  final String plantname;
  final String plantnameMain;

  timerPage({Key key, @required this.duration, this.plantname,this.plantnameMain}) : super(key: key);

  @override
  _timerPage createState() => _timerPage();
}

class _timerPage extends State<timerPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  Timer _timer;
  int tempVal;
  int _start;
  ProgressController controller;

  //final now = Duration(seconds: 60);
  bool timerStarted = false;

  @override
  void initState() {
    _start=widget.duration;
    controller = ProgressController(
      duration: Duration(seconds: _start),
    );
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if(timerStarted){
      _timer.cancel();
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      print('state paused______________________');
      tempVal = _start;
      print('tempVal ${tempVal}______________________');
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appBar(),
      body: Container(
        height: 100.0.h,
        width: 100.0.w,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            timerStarted ? _topText2(context) : _topText(context),
            SizedBox(
              height: 10.0.h,
            ),
            _countdownTimer(context,widget.duration, widget.plantname, widget.plantnameMain),
            SizedBox(
              height: 10.0.h,
            ),
            _showTimer(),
            SizedBox(
              height: 10.0.h,
            ),
            timerStarted ? _bottomText(context) : _raisedButton(context),
            SizedBox(
              height: 10.0.h,
            ),
            /*RaisedButton(
              onPressed: controller.restart,
              child: Text('Restart'),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _topText(BuildContext context) {
    return Text(
      "Plant now!",
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 24.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _topText2(BuildContext context) {
    return Text(
      "Growing..",
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 24.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _countdownTimer(BuildContext context, int dur, String _pname, String _pnameMain) {
    return Container(
      height: 50.0.w,
      width: 50.0.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white,
        image: DecorationImage(
          image: AssetImage('${checkPAth(widget.plantname)}'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9), BlendMode.dstATop),
        ),
      ),
      child: RestartableCircularProgressIndicator(
        controller: controller,
        onTimeout: () {
          print('timeout');
          TaskModel3 mytask;
          final ToDoHelper _doHelper = ToDoHelper();
          mytask = TaskModel3(
            quote: _pname, duration: dur, namemain: _pnameMain
          );
          _doHelper.initTaskPQ(mytask).whenComplete(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => plantGrown()),
            );
          });
        },
      ),
    );
  }

  Widget _showTimer() {
    return Text(
      '${_printDuration(Duration(seconds: _start))}',
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 15.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _bottomText(BuildContext context) {
    return Container(
      height: 10.0.h,
      width: 70.0.w,
      child: Text(
        "Stay away from the phone and your tree grows!",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 17.0.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _raisedButton(BuildContext context) {
    return custButton(
      widt: 10.0.w,
      heigh: 10.0.w,
      child: Text(
        "Start",
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 17.0.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPress: () {
        if (timerStarted) {
          timerStarted = false;
        } else {
          timerStarted = true;
        }
        startTimer();
        controller.start();
      },
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String checkPAth(String _pname){
    if(_pname=='plant1.jpg'){
      return 'assets/images/plant1.jpg';
    }else if(_pname=='plant2.jpg'){
      return 'assets/images/plant2.jpg';
    }else if(_pname=='plant3.jpg'){
      return 'assets/images/plant3.jpg';
    }else if(_pname=='plant4.jpg'){
      return 'assets/images/plant4.jpg';
    }else if(_pname=='plant5.jpg'){
      return 'assets/images/plant5.jpg';
    }else if(_pname=='plant6.jpg'){
      return 'assets/images/plant6.jpg';
    }else if(_pname=='plant7.jpg'){
      return 'assets/images/plant7.jpg';
    }else if(_pname=='plant8.jpg'){
      return 'assets/images/plant8.jpg';
    }else if(_pname=='plant9.jpg'){
      return 'assets/images/plant9.jpg';
    }
  }
}

/*-------------------------------------timer widget-----------------------------------*/
class ProgressController {
  static const double smoothnessConstant = 250;

  final Duration duration;
  final Duration tickPeriod;

  Timer _timer;
  Timer _periodicTimer;

  Stream<void> get progressStream => _progressController.stream;
  StreamController<void> _progressController =
      StreamController<void>.broadcast();

  Stream<void> get timeoutStream => _timeoutController.stream;
  StreamController<void> _timeoutController =
      StreamController<void>.broadcast();

  double get progress => _progress;
  double _progress = 0;

  ProgressController({@required this.duration})
      : assert(duration != null),
        tickPeriod = _calculateTickPeriod(duration);

  void start() {
    _timer = Timer(duration, () {
      _cancelTimers();
      _setProgressAndNotify(1);
      _timeoutController.add(null);
    });

    _periodicTimer = Timer.periodic(
      tickPeriod,
      (Timer timer) {
        double progress = _calculateProgress(timer);
        _setProgressAndNotify(progress);
      },
    );
  }

  void restart() {
    _cancelTimers();
    start();
  }

  Future<void> dispose() async {
    await _cancelStreams();
    _cancelTimers();
  }

  double _calculateProgress(Timer timer) {
    double progress = timer.tick / smoothnessConstant;

    if (progress > 1) return 1;
    if (progress < 0) return 0;
    return progress;
  }

  void _setProgressAndNotify(double value) {
    _progress = value;
    _progressController.add(null);
  }

  Future<void> _cancelStreams() async {
    if (!_progressController.isClosed) await _progressController.close();
    if (!_timeoutController.isClosed) await _timeoutController.close();
  }

  void _cancelTimers() {
    if (_timer?.isActive == true) _timer.cancel();
    if (_periodicTimer?.isActive == true) _periodicTimer.cancel();
  }

  static Duration _calculateTickPeriod(Duration duration) {
    double tickPeriodMs = duration.inMilliseconds / smoothnessConstant;
    return Duration(milliseconds: tickPeriodMs.toInt());
  }
}

class RestartableCircularProgressIndicator extends StatefulWidget {
  final ProgressController controller;
  final VoidCallback onTimeout;

  RestartableCircularProgressIndicator({
    Key key,
    @required this.controller,
    this.onTimeout,
  })  : assert(controller != null),
        super(key: key);

  @override
  _RestartableCircularProgressIndicatorState createState() =>
      _RestartableCircularProgressIndicatorState();
}

class _RestartableCircularProgressIndicatorState
    extends State<RestartableCircularProgressIndicator> {
  ProgressController get controller => widget.controller;

  VoidCallback get onTimeout => widget.onTimeout;

  @override
  void initState() {
    super.initState();
    controller.progressStream.listen((_) => updateState());
    controller.timeoutStream.listen((_) => onTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.black,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
      value: controller.progress,
      strokeWidth: 3.0.w,
    );
  }

  void updateState() => setState(() {});
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ProgressController controller;

  @override
  void initState() {
    super.initState();
    controller = ProgressController(
      duration: Duration(seconds: 60),
    );
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    debugPrint(controller._progress.toString());
    super.setState(fn);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    if (state == AppLifecycleState.paused) {}
    if (state == AppLifecycleState.resumed) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.0.w,
                width: 50.0.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: RestartableCircularProgressIndicator(
                  controller: controller,
                  onTimeout: () => print('timeout'),
                ),
              ),
              RaisedButton(
                onPressed: controller.start,
                child: Text('Start'),
              ),
              RaisedButton(
                onPressed: controller.restart,
                child: Text('Restart'),
              ),
              _showTimer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showTimer() {
    return Text(
      '${controller._progress}',
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 15.0.sp,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

/*-------------------------------------timer widget-----------------------------------*/
/*-------------------------------------Confitti-----------------------------------*/
class plantGrown extends StatefulWidget {
  @override
  _plantGrownState createState() => _plantGrownState();
}

class _plantGrownState extends State<plantGrown> {

  @override
  void initState() {
    // TODO: implement initState
    final player =new AudioCache();
    player.play('audiofiles/tada.wav');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Confitti(
      child: Text(
        'Show!',
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 17.0.sp,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
      child2: Text(
        'You have grown a new tree!',
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 19.0.sp,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      onPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => myForest()),
          //You(index: index)
        );
      },
    );
  }
}
