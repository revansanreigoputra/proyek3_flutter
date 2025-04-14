import 'package:flutter/material.dart';
import 'package:proyek3_flutter/core/components/loading_indicator.dart';
import 'package:proyek3_flutter/core/components/spaces.dart';
import 'package:proyek3_flutter/core/constants/colors.dart';
import 'package:proyek3_flutter/core/extensions/build_context_ext.dart';
import 'package:proyek3_flutter/presentation/partner/ticket/blocs/get_ticket_user/get_ticket_user_bloc.dart';
import 'package:proyek3_flutter/presentation/partner/ticket/pages/add_ticket_page.dart';
import 'package:proyek3_flutter/presentation/partner/ticket/widgets/card_ticket_partner.dart';
import 'package:proyek3_flutter/presentation/partner/ticket/widgets/empty_ticket_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketPartnerPage extends StatefulWidget {
  const TicketPartnerPage({super.key});

  @override
  State<TicketPartnerPage> createState() => _TicketPartnerPageState();
}

class _TicketPartnerPageState extends State<TicketPartnerPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetTicketUserBloc>()
        .add(const GetTicketUserEvent.getTicketUser());
  }

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
          "Kelola Tiket",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              context.push(const AddTicketPage());
            },
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SpaceWidth(16)
        ],
      ),
      body: BlocBuilder<GetTicketUserBloc, GetTicketUserState>(
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const SizedBox.shrink();
          }, loading: () {
            return const LoadingIndicator();
          }, success: (data) {
            if (data.data!.isEmpty) {
              return const EmptyTicketWidget();
            }

            return ListView.separated(
              itemCount: data.data!.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SpaceHeight(2);
              },
              itemBuilder: (BuildContext context, int index) {
                return CardTicketPartner(
                  model: data.data![index],
                );
              },
            );
          });
        },
      ),
    );
  }
}
