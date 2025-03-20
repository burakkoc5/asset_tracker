import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:asset_tracker/features/settings/application/settings_cubit.dart';
import 'package:asset_tracker/features/settings/domain/app_settings.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/presentation/socket_list.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Reset search when screen builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SocketCubit>().resetSearch();
    });

    return Scaffold(
      appBar: AppBar(
        title: Builder(
          // Tekrar kontrol et neden appbar text normalde dil değişikliklerini dinlemiyor
          builder: (context) {
            try {
              return BlocBuilder<SettingsCubit, AppSettings>(
                buildWhen: (previous, current) =>
                    previous.locale != current.locale,
                builder: (context, state) {
                  return Text(t.home.title);
                },
              );
            } catch (e) {
              return Text(t.home.title);
            }
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBarWidget(
              onChanged: (query) {
                context.read<SocketCubit>().filterData(query);
              },
            ),
            Paddings.xxs.vertical,
            const Expanded(
              child: SocketList(),
            ),
          ],
        ),
      ),
    );
  }
}
