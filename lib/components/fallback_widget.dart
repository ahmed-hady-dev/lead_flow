import 'package:flutter/material.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

class FallbackWidget extends StatelessWidget {
  const FallbackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.2),
      child: Center(
        child: Text('حدث خطأ ما برجاء اعادة المحاولة...',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.redAccent)),
      ),
    );
  }
}
