import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/models/Address.dart';
import 'package:flutter_mobile_app/models/Location.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/services/nominatim_api.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:flutter_mobile_app/utils/theme_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'Settings');
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final OverpassApi _overpassApi = OverpassApi();
  final NominatimApi _nominatimApi = NominatimApi();
  bool _isdark = false;
  final Location _home = Location();
  final Location _work = Location();

  Future<void> loadLocation(
    Location location,
    LatLng addressPosition,
    int stationId,
  ) async {
    try {
      POI station = await _overpassApi.getPOIbyID(id: stationId);
      Address address = await _nominatimApi.getAddressByPosition(
        position: addressPosition,
      );

      setState(() {
        location.station = station;
        location.address = address;
      });
    } catch (e) {
      throw Exception("");
    }
  }

  void darkModeSwitch(bool isdark) {
    setState(() {
      _isdark = !isdark;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocation(
      _home,
      LatLng(51.24372380970368, -0.600301771646355),
      5863634798,
    );
    loadLocation(
      _work,
      LatLng(51.521555305395786, -0.1648146847784949),
      5206785234,
    ); // 402767337 3638795617
    // loadStation(402767337, "work", _overpassApi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text(widget.title),
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          Switch(
            value: _isdark == false,
            onChanged: (tap) {
              darkModeSwitch(tap);
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 22,
              padding: EdgeInsets.only(top: 1, left: 2),
              child: Text("Locations"),
            ),
            _locationsRow(
              context,
              "Home",
              "${_home.address?.shortName == null ? "Loading" : "${_home.address?.shortName}"} | ${_home.station?.name == null ? "Loading" : "${_home.station?.name} Station"}",
              Icons.home,
              () => (print(_home)),
            ),
            _locationsRow(
              context,
              "Work",
              "${_work.address?.shortName == null ? "Loading" : "${_work.address?.shortName}"} | ${_work.station?.name == null ? "Loading" : "${_work.station?.name} Station"}",
              Icons.work,
              () => (print(_work)),
            ),
            Container(
              height: 22,
              margin: EdgeInsets.only(top: 1, left: 2),
              child: Text("Preferences (dummy)"),
            ),
            ...List.generate(6, (index) {
              return _row(context, labels[index], icons[index]);
            }),
            Container(
              height: 22,
              margin: EdgeInsets.only(top: 1, left: 2),
              child: Text("Account (dummy)"),
            ),
            ...List.generate(3, (index) {
              return _row(
                context,
                labels_account[index],
                icons_account[index],
                isAccount: true,
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget _locationsRow(
  context,
  String text1,
  String text2,
  IconData icon,
  VoidCallback onTap,
) {
  return Container(
    width: double.infinity,
    height: 56,
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 1),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

    child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 13),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1, style: Theme.of(context).textTheme.bodyMedium),
            Text(text2, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        Spacer(),
        GestureDetector(onTap: onTap, child: Icon(Icons.more_horiz)),
      ],
    ),
  );
}

Widget _row(context, String text1, IconData icon, {bool isAccount = false}) {
  return Container(
    width: double.infinity,
    height: 56,
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 1),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

    child: Row(
      children: [
        Icon(icon, color: isAccount ? Colors.red : null),
        SizedBox(width: 13),
        Text(text1, style: Theme.of(context).textTheme.bodyMedium),
        Spacer(),
        Icon(Icons.arrow_forward_ios_sharp, size: 14),
      ],
    ),
  );
}

final List<String> labels = [
  "Notifications",
  "Privacy",
  "Language",
  "Account",
  "Security",
  "Appearance",
  "Sounds",
  "Location",
  "Data Usage",
  "Password",
  "Help",
  "About",
  "Feedback",
  "Blocked Users",
  "Accessibility",
  "Updates",
];

final List<IconData> icons = [
  Icons.notifications,
  Icons.lock_outline,
  Icons.language,
  Icons.person_outline,
  Icons.security,
  Icons.palette,
  Icons.volume_up,
  Icons.location_on,
  Icons.data_usage,
  Icons.vpn_key,
  Icons.help_outline,
  Icons.info_outline,
  Icons.feedback_outlined,
  Icons.block,
  Icons.accessibility_new,
  Icons.system_update,
];

final List<String> labels_account = [
  "Change Password",
  "Log Out",
  "Delete Account",
];

final List<IconData> icons_account = [
  Icons.password_rounded,
  Icons.logout_rounded,
  Icons.delete_forever_outlined,
];
