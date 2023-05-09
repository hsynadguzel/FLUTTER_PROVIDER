import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/provider.dart';
import 'package:provider/provider.dart';

class ApiListScreen extends StatefulWidget {
  const ApiListScreen({super.key});

  @override
  State<ApiListScreen> createState() => _ApiListScreenState();
}

class _ApiListScreenState extends State<ApiListScreen> {
  @override
  void initState() {
    Provider.of<TCMBBilgiAmacliKurlarProvider>(context, listen: false)
        .fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TCMBBilgiAmacliKurlarProvider>(
      builder: (context, value, child) {
        if (value.tcbmBilgiAmacliKurlar!.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: appBar(),
            floatingActionButton: floatActionButton(context),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ListView.builder(
                  itemCount: value.tcbmBilgiAmacliKurlar!.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 2.0,
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      title: Text(
                          'Name: ${value.tcbmBilgiAmacliKurlar![index].isim}'),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kod:  ${value.tcbmBilgiAmacliKurlar![index].kod}',
                          ),
                          Text(
                            'Exchange Rate:  ${value.tcbmBilgiAmacliKurlar![index].exchangeRate}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: const Text(
        'TCMB Bilgi Amaçlı Kurlar',
        style: TextStyle(
          fontSize: 20.0,
          color: Color.fromARGB(255, 9, 70, 121),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  FloatingActionButton floatActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<TCMBBilgiAmacliKurlarProvider>(context, listen: false)
            .fetchData();
      },
      backgroundColor: const Color.fromARGB(255, 9, 70, 121),
      tooltip: 'Refresh',
      child: const Icon(Icons.refresh),
    );
  }
}
