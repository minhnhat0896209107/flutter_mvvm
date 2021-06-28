import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetSwitchSetting extends StatefulWidget {
  WidgetSwitchSetting({Key? key}) : super(key: key);

  @override
  _WidgetSwitchSettingState createState() => _WidgetSwitchSettingState();
}

class _WidgetSwitchSettingState extends State<WidgetSwitchSetting> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.055,
      child: Center(
        child: WidgetSwitchButton(
          value: true,
          onChanged: (value) {
            print(value);
          },
          activeColor: Colors.purple,
          inactiveColor: Colors.grey,
        ),
      ),
    );
  }
}

class WidgetSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  WidgetSwitchButton(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.activeColor,
      this.inactiveColor})
      : super(key: key);

  @override
  _WidgetSwitchButtonState createState() => _WidgetSwitchButtonState();
}

class _WidgetSwitchButtonState extends State<WidgetSwitchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _moveAnimation;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _moveAnimation = Tween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(_animationController);

    _colorAnimation = ColorTween(
            begin: widget.value ? widget.activeColor : widget.inactiveColor,
            end: widget.value ? widget.inactiveColor : widget.activeColor)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          child: Container(
            height: 30,
            width: 50,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(90),
            ),
            alignment: _moveAnimation.value,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            _moveAnimation.value == Alignment.centerLeft
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
        );
      },
    );
  }
}
