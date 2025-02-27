import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/presentation/currency_card.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocketList extends StatefulWidget {
  const SocketList({super.key});

  @override
  State<SocketList> createState() => _SocketListState();
}

class _SocketListState extends State<SocketList> {
  bool isDisconnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SocketCubit, SocketState>(
        builder: (context, state) {
          //debugPrint('Current state: $state');

          if (state is SocketLoading) {
            debugPrint('Socket is loading...');
            return const Center(child: CircularProgressIndicator());
          } else if (state is SocketError) {
            debugPrint('Socket encountered an error: ${state.error}');
            return Center(
                child: Text(t.socket.status.error(message: state.error)));
          } else if (state is SocketConnected) {
            debugPrint('Socket connected.');
            return const Center(child: CircularProgressIndicator());
          } else if (state is SocketDataReceived) {
            //debugPrint('Socket data received.');
            isDisconnected = false;
            return _buildDataReceivedUI(context, state.data);
          } else if (state is SocketDisconnected) {
            debugPrint('Socket disconnected.');
            isDisconnected = true;
            return _buildDataReceivedUI(context, state.data);
          } else {
            debugPrint('Initializing...');
            return Center(child: Text(t.home.initializing));
          }
        },
      ),
    );
  }

  Widget _buildDataReceivedUI(BuildContext context, response) {
    debugPrint('Building UI with received data: ${response.data.length} items');

    final lastUpdate = DateTime.fromMillisecondsSinceEpoch(response.meta.time);
    final now = DateTime.now();
    final difference = now.difference(lastUpdate);

    String getUpdateText() {
      if (difference.inSeconds < 60) {
        return t.currency.time.seconds(count: difference.inSeconds);
      } else if (difference.inMinutes < 60) {
        return t.currency.time.minutes(count: difference.inMinutes);
      } else if (difference.inHours < 24) {
        return t.currency.time.hours(count: difference.inHours);
      } else {
        return t.currency.time.days(count: difference.inDays);
      }
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isDisconnected)
            Padding(
              padding: Paddings.md.all,
              child: Card(
                color: Theme.of(context).extension<CustomAppColors>()?.error,
                child: Padding(
                  padding: Paddings.sm.all,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          color: Theme.of(context)
                              .extension<CustomAppColors>()
                              ?.white),
                      Paddings.xs.horizontal,
                      Text(
                        t.core.errors.socketDisconnected,
                        style: TextStyle(
                            color: Theme.of(context)
                                .extension<CustomAppColors>()
                                ?.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Padding(
            padding: Paddings.sm.only(left: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.update,
                  size: 14,
                  color: Colors.grey[600],
                ),
                Paddings.xxs.horizontal,
                Text(
                  t.currency.details.lastUpdateTime(time: getUpdateText()),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: response.data.length,
            itemBuilder: (context, index) {
              final entry = response.data.entries.toList()[index];
              final currency = entry.value;
              //debugPrint('Rendering CurrencyCard for: ${currency.toString()}');
              return CurrencyCard(
                currency: currency,
              );
            },
          ),
        ],
      ),
    );
  }
}
