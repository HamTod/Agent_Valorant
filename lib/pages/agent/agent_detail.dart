import 'package:agent_valorant/helpers/platform_aware_asset_image.dart';
import 'package:agent_valorant/models/agent_item.dart';
import 'package:agent_valorant/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgentDetail extends StatefulWidget {
  static const routeName = '/detail';
  //const AgentDetail(AgentItem agentItem, {Key? key}) : super(key: key);
  final AgentItem agent;
  AgentDetail(this.agent);
  @override
  _AgentDetailState createState() => _AgentDetailState();
}

class _AgentDetailState extends State<AgentDetail> {
  @override
  Widget build(BuildContext context) {
    // var agentItem = ModalRoute.of(context)!.settings.arguments as AgentItem;
    final appBar = AppBar(
      backgroundColor: Color(0xFF950101),
      elevation: .5,
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

    final topLeft = Padding(
      padding: EdgeInsets.all(16.0),
      child: Hero(
        tag: widget.agent.Name,
        child: Material(
          elevation: 20.0,
          shadowColor: Colors.black,
          child: PlatformAwareAssetImage(
            assetPath: 'assets/images/${widget.agent.image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('\n ${widget.agent.Name}',
              style: GoogleFonts.ubuntu(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        SizedBox(height: 32.0),
        Container(
          child: Text(
            ' ${widget.agent.description}\n',
            style: GoogleFonts.prompt(
                fontSize: 15.0, height: 1.5, color: Colors.white54),
          ),
        ),
        Column(
          children: [
            //Skill Q
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.75),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(color: Color(0xFF950101)),
                      child: Center(
                        child: Text(
                          'Ⓠ',
                          style:
                          const TextStyle(fontSize: 45.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.agent.q,
                              style: GoogleFonts.prompt(
                                  fontSize: 20.0,
                                  height: 1.5,
                                  color: Colors.black87),
                            ),
                            Text(
                              widget.agent.q_detail,
                              style: GoogleFonts.prompt(
                                  fontSize: 15.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            //skill E
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.75),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(color: Color(0xFF950101)),
                      child: Center(
                        child: Text(
                          'Ⓔ',
                          style:
                          const TextStyle(fontSize: 45.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.agent.e,
                              style: GoogleFonts.prompt(
                                  fontSize: 20.0,
                                  height: 1.5,
                                  color: Colors.black87),
                            ),
                            Text(
                              widget.agent.e_detail,
                              style: GoogleFonts.prompt(
                                  fontSize: 15.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            //skill C
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.75),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(color: Color(0xFF950101)),
                      child: Center(
                        child: Text(
                          'Ⓒ',
                          style:
                          const TextStyle(fontSize: 45.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.agent.c,
                              style: GoogleFonts.prompt(
                                  fontSize: 20.0,
                                  height: 1.5,
                                  color: Colors.black87),
                            ),
                            Text(
                              widget.agent.c_detail,
                              style: GoogleFonts.prompt(
                                  fontSize: 15.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            //skill X
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.75),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(color: Color(0xFF950101)),
                      child: Center(
                        child: Text(
                          'Ⓧ',
                          style:
                          const TextStyle(fontSize: 45.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.agent.x,
                              style: GoogleFonts.prompt(
                                  fontSize: 20.0,
                                  height: 1.5,
                                  color: Colors.black87),
                            ),
                            Text(
                              widget.agent.x_detail,
                              style: GoogleFonts.prompt(
                                  fontSize: 15.0, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
    final topContent = Container(
      color: Color(0xFF3D0000),
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF3D0000),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent],
        ),
      ),
    );
  }
}
