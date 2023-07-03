import 'package:flutter/material.dart';

class Pertemuan14Screen extends StatefulWidget {
  const Pertemuan14Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan14Screen> createState() => _Pertemuan14ScreenState();
}

class _Pertemuan14ScreenState extends State<Pertemuan14Screen> {
  DateTimeRange? _dateRange;
  TextEditingController? _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Range Picker
            Row(
              children: [
                const Text('Rentang Tanggal:'),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    enabled: false,
                    decoration:
                        const InputDecoration(labelText: 'Rentang Tanggal'),
                    controller: TextEditingController(
                      text: _dateRange != null
                          ? '${_dateRange!.start.toString().split(' ')[0]} - ${_dateRange!.end.toString().split(' ')[0]}'
                          : '',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var res = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2500),
                    );

                    if (res != null) {
                      setState(() {
                        _dateRange = res;
                        _time =
                            null; // Menghapus nilai waktu saat memilih rentang tanggal baru
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),

            if (_dateRange != null)
              ListTile(
                title: const Text('Rentang Tanggal Terpilih'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Mulai: ${_dateRange!.start.toString().split(' ')[0]}'),
                    Text('Akhir: ${_dateRange!.end.toString().split(' ')[0]}'),
                  ],
                ),
              ),

            const Divider(),

            // Time Picker
            Row(
              children: [
                const Text('Jam:'),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    enabled: false,
                    controller: _time,
                    decoration: const InputDecoration(labelText: 'Jam'),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var res = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (res != null) {
                      setState(() {
                        _time =
                            TextEditingController(text: res.format(context));
                      });
                    }
                  },
                  icon: const Icon(Icons.timer),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
