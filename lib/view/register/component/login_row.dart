import 'package:flutter/material.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('هل لديك حساب؟', style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {},
          child: const Text('تسجيل الدخول'),
        ),
      ],
    );
  }
}
