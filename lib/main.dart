import 'package:agent_valorant/models/agent_item.dart';
import 'package:agent_valorant/pages/agent/agent_detail.dart';
import 'package:agent_valorant/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agents VALORANT',

      home: SplashScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
      //initialRoute: AgentListPage.routeName,
    );
  }

  generateRoute(RouteSettings settings) {
    final path = settings.name!.split('/');
    final title = path[1];

    AgentItem agent= items.firstWhere((it) => it.Name == title);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => AgentDetail(agent),
    );
  }
}