import 'package:agent_valorant/helpers/platform_aware_asset_image.dart';
import 'package:agent_valorant/models/agent_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Color(0xFF950101),
      elevation: .5,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Row(
        children: [
           Image.asset('images/logo.png',height: 30.0,),
          Text(
            ' VALORANT ',
            style: GoogleFonts.prompt(),
          ),
        ],
      ),

    );

    createTile(AgentItem agentItem) => Hero(
          tag: agentItem.Name,
          child: Material(color: Color(0xFF3D0000),
            //elevation: 15.0,
            //shadowColor: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail/${agentItem.Name}');
              },
              child: Row(
                children: <Widget>[
                  PlatformAwareAssetImage(
                    assetPath: 'assets/images/${agentItem.image}',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        );
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 9 / 16,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: items.map((a) => createTile(a)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFF3D0000),
      appBar: appBar,
      body: grid,
    );
  }
}
