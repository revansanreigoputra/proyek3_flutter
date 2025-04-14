import 'package:flutter/material.dart';
import 'package:proyek3_flutter/core/assets/assets.gen.dart';
import 'package:proyek3_flutter/core/components/spaces.dart';
import 'package:proyek3_flutter/core/constants/colors.dart';

class EmptyTransactionWidget extends StatelessWidget {
  const EmptyTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.emptyTransaction.path,
            width: 193.0,
            fit: BoxFit.cover,
          ),
          const SpaceHeight(4),
          const Text(
            "Transaksi Masih Kosong",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack2,
            ),
          ),
          const SpaceHeight(4),
          const Text(
            "Tingkatkan promosi atau diskon spesial",
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
