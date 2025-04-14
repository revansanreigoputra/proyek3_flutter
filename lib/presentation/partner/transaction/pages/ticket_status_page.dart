// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:proyek3_flutter/core/assets/assets.gen.dart';
import 'package:proyek3_flutter/core/components/buttons.dart';
import 'package:proyek3_flutter/core/components/spaces.dart';
import 'package:proyek3_flutter/core/constants/colors.dart';
import 'package:proyek3_flutter/core/extensions/build_context_ext.dart';

class TicketStatusPage extends StatelessWidget {
  final bool isSuccess;
  const TicketStatusPage({
    super.key,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.biru,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Ticket Status",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: context.deviceWidth,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Image.asset(
              isSuccess
                  ? Assets.images.orderConfrimed.path
                  : Assets.images.orderFailed.path,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SpaceHeight(16),
            Text(
              isSuccess
                  ? "Tiket berhasil diverifikasi:"
                  : "Tiket gagal diverifikasi:",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack2,
              ),
            ),
            const SpaceHeight(16),
            Text(
              isSuccess
                  ? "Tiket sudah terverifikasi dengan sukses. Pengunjung kini dapat menikmati pengalaman mereka dengan lancar."
                  : "Verifikasi gagal. Pastikan tiket yang Anda scan sudah benar dan coba lagi.",
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SpaceHeight(16),
            Button.filled(
              height: 48,
              color: isSuccess ? AppColors.biru : AppColors.red,
              onPressed: () {
                if (isSuccess) {
                  context.pop();
                }
              },
              label: isSuccess ? 'Mengerti' : 'Scan Lagi',
            )
          ],
        ),
      ),
    );
  }
}
