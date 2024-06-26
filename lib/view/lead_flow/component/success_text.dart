import 'package:flutter/material.dart';

class SuccessText extends StatefulWidget {
  const SuccessText({super.key});

  @override
  _SuccessTextState createState() => _SuccessTextState();
}

class _SuccessTextState extends State<SuccessText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubicEmphasized,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Column(
        children: <Widget>[
          Text(
            'تم الدفع بنجاح',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(height: 8),
          Text(
            'شكراً لك على ثقتك في المدرسة دوت كوم',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
