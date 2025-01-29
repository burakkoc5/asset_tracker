import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/presentation/currency_card.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDisconnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.title),
      ),
      body: BlocBuilder<SocketCubit, SocketState>(
        builder: (context, state) {
          if (state is SocketLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SocketError) {
            return Center(
                child: Text(t.socket.status.error(message: state.error)));
          } else if (state is SocketConnected) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SocketDataReceived) {
            isDisconnected = false;
            return _buildDataReceivedUI(context, state.data);
          } else if (state is SocketDisconnected) {
            isDisconnected = true;
            return _buildDataReceivedUI(context, state.data);
          } else {
            return Center(child: Text(t.home.initializing));
          }
        },
      ),
    );
  }

  Widget _buildDataReceivedUI(BuildContext context, response) {
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

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isDisconnected)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          t.core.errors.socketDisconnected,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.update,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    t.currency.details.lastUpdateTime(time: getUpdateText()),
                    style: Theme.of(context).textTheme.bodyMedium,
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
                Currency currency = entry.value;
                return CurrencyCard(currency: currency);
              },
            ),
          ],
        ),
      ),
    );
  }
}
