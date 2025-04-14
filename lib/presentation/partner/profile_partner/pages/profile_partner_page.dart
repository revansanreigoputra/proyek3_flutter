import 'package:flutter/material.dart';
import 'package:proyek3_flutter/core/assets/assets.gen.dart';
import 'package:proyek3_flutter/core/components/buttons.dart';
import 'package:proyek3_flutter/core/components/spaces.dart';
import 'package:proyek3_flutter/core/constants/colors.dart';
import 'package:proyek3_flutter/core/extensions/build_context_ext.dart';
import 'package:proyek3_flutter/core/components/loading_indicator.dart';
import 'package:proyek3_flutter/data/datasources/auth_local_datasource.dart';
import 'package:proyek3_flutter/presentation/auth/blocs/logout/logout_bloc.dart';
import 'package:proyek3_flutter/presentation/auth/pages/login_page.dart';
import 'package:proyek3_flutter/presentation/profile/pages/status_account_page.dart';
import 'package:proyek3_flutter/presentation/profile/widgets/item_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePartnerPage extends StatelessWidget {
  const ProfilePartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBackground,
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(18.0),
          child: BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: (message) async {
                  await AuthLocalDatasource().removeAuthData();
                  context.showSnackBar(
                    message,
                  );
                  context.pushReplacement(const LoginPage());
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.filled(
                    onPressed: () {
                      context
                          .read<LogoutBloc>()
                          .add(const LogoutEvent.logout());
                    },
                    label: 'Logout',
                    color: AppColors.red,
                  );
                },
                loading: () {
                  return const LoadingIndicator();
                },
              );
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.all(30.0),
              decoration: const BoxDecoration(
                color: AppColors.biru,
              ),
              child: Column(
                children: [
                  const SpaceHeight(16),
                  Image.asset(
                    'assets/images/Logo3.png',
                    width: context.deviceWidth,
                    fit: BoxFit.cover,
                  ),
                  const SpaceHeight(16),
                  const Text(
                    "Tim kami sedang memeriksa data Anda. Kami akan segera mengaktifkan akun Anda.",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SpaceHeight(16),
                  GestureDetector(
                    onTap: () {
                      context.push(const StatusAccountPage());
                    },
                    child: Container(
                      width: context.deviceWidth,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.biru,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.white,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Status Akun",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const ItemMenu(title: "Versi Aplikasi"),
            // const SpaceHeight(4),
            // const ItemMenu(title: "Syarat dan Ketentuan Layanan"),
            // const SpaceHeight(4),
            // const ItemMenu(title: "Kebijakan Privasi "),
            // const SpaceHeight(4),
            // const ItemMenu(title: "Tentang Ayo Piknik"),
          ],
        ));
  }
}
