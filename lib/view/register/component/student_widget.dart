// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:lead_flow/core/helpers/extensions.dart';
//
// import '../../../constants/app_colors.dart';
// import '../controller/auth_cubit.dart';
//
// class StudentWidget extends StatelessWidget {
//   const StudentWidget({
//     super.key,
//     this.onTap,
//   });
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthCubit, AuthState>(
//       builder: (context, state) {
//         var authCubit = AuthCubit.get(context);
//         return InkWell(
//           onTap: onTap,
//           radius: 20,
//           borderRadius: BorderRadius.circular(16),
//           child: Column(
//             children: [
//               Container(
//                 width: width * 0.25,
//                 height: width * 0.25,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.primaryYellow,
//                 ),
//                 child: const Icon(Icons.face, color: Colors.white, size: 60),
//               ),
//               Gap(height * 0.02),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     (authCubit.isChosen == true && authCubit.isStudent == true)
//                         ? const Row(
//                             children: [Icon(Icons.check_circle_outline_rounded, color: AppColors.primaryGreen), Gap(4)],
//                           )
//                         : const SizedBox(),
//                     Text(
//                       'طالب',
//                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           color: (authCubit.isChosen == true && authCubit.isStudent == true)
//                               ? AppColors.primaryGreen
//                               : Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
