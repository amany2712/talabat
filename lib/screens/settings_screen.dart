import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat/controller/provider_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerController = Provider.of<ProviderController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person,
                   size: 100,
                   color: Colors.grey[200],
                   ),
                ),
              ),
              SizedBox(height: 16,),
              ListTile(
                leading: Icon(Icons.dark_mode,
                color: Color(0xFFF55540),
                ),
                title: Text("Dark Theme"),
                trailing: Switch(
                  value: providerController.isDark,
                  onChanged: (value) {
                    providerController.changeTheme(value);

                  },
                  activeColor: Color(0xFFF55540),
                ),
              ),
              SizedBox(height: 8,),
              ListTile(
                leading: Icon(Icons.language,
                color: Color(0xFFF55540),
                ),
                title: Text("Language"),
                trailing: Icon(Icons.arrow_forward_ios,
                color: Color(0xFFF55540),
                ),
              ),
              SizedBox(height: 8,),
              ListTile(
                leading: Icon(Icons.logout,
                color: Color(0xFFF55540),
                ),
                title: Text("Logout"),
                trailing: Icon(Icons.arrow_forward_ios,
                color: Color(0xFFF55540),
                ),
              ),

          
            ],
          ),
        ),
      ),
    );
  }
  //statemanagement
}