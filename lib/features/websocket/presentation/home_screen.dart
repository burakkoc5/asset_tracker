import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/domain/price_changed_data_model.dart';
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
        title: Text('Socket Tracker'),
      ),
      body: BlocBuilder<SocketCubit, SocketState>(
        builder: (context, state) {
          if (state is SocketLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SocketError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is SocketConnected) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SocketDataReceived) {
            isDisconnected = false;
            return _buildDataReceivedUI(context, state.data);
          } else if (state is SocketDisconnected) {
            isDisconnected = true;
            return _buildDataReceivedUI(context, state.data);
          } else {
            return Center(child: Text('Initializing...'));
          }
        },
      ),
    );
  }

  Widget _buildDataReceivedUI(BuildContext context, response) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received Data',
                style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: 20),
            if (isDisconnected)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Connection lost. Showing last available data...',
                  style: TextStyle(color: Colors.red),
                ),
              ),

            // Time from int
            Text(
                'Time: ${DateTime.fromMillisecondsSinceEpoch(response.meta.time)}'),
            // Using ListView.builder to display the currency data
            ListView.builder(
              shrinkWrap:
                  true, // To avoid scrolling issues within a SingleChildScrollView
              physics:
                  NeverScrollableScrollPhysics(), // Disable scrolling of ListView
              itemCount: response.data.length,
              itemBuilder: (context, index) {
                final entry = response.data.entries.toList()[index];
                Currency currency = entry.value;
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListTile(
                    title: Text(currency.code),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Alis: ${currency.alis}'),
                        Text('Satis: ${currency.satis}'),
                        Text('Tarih: ${currency.tarih}'),
                        Text('Dusuk: ${currency.dusuk}'),
                        Text('Yuksek: ${currency.yuksek}'),
                        Text('Kapanis: ${currency.kapanis}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
