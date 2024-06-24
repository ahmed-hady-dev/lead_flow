// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:lead_flow/core/helpers/extensions.dart';
//
// import '../../../constants/app_colors.dart';
// import '../controller/auth_cubit.dart';
//
// class ParentWidget extends StatelessWidget {
//   const ParentWidget({
//     super.key,
//     this.onTap,
//   });
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     final authCubit = AuthCubit.get(context);
//     return InkWell(
//       onTap: onTap,
//       radius: 20,
//       borderRadius: BorderRadius.circular(16),
//       child: Column(
//         children: [
//           Container(
//             width: width * 0.25,
//             height: width * 0.25,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: AppColors.primaryGreen,
//             ),
//             child: const Icon(Icons.escalator_warning, color: Colors.white, size: 60),
//           ),
//           Gap(height * 0.02),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_circle_outline_rounded,
//                       color: (authCubit.isChosen == true && authCubit.isStudent == false)
//                           ? AppColors.primaryGreen
//                           : Colors.transparent,
//                       size: (authCubit.isChosen == true && authCubit.isStudent == false) ? 24 : 24,
//                     ),
//                     const Gap(4),
//                   ],
//                 ),
//                 // (authCubit.isChosen == true && authCubit.isStudent == false)
//                 //     ? const Row(
//                 //         children: [
//                 //           Icon(
//                 //             Icons.check_circle_outline_rounded,
//                 //             color: AppColors.primaryGreen,
//                 //           ),
//                 //           Gap(4),
//                 //         ],
//                 //       )
//                 //     : const SizedBox(),
//                 Text(
//                   'ولي أمر',
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                         color: (authCubit.isChosen == true && authCubit.isStudent == false)
//                             ? AppColors.primaryGreen
//                             : Colors.black,
//                       ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//     ;
//   }
// }
