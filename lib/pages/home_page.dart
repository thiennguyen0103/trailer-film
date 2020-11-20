import 'package:flutter/material.dart';
import 'package:trailerfilm_app/constant/data_json.dart';
import 'package:trailerfilm_app/theme/colors.dart';
import 'package:trailerfilm_app/widgets/video_description.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:trailerfilm_app/widgets/right_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
            videoUrl: items[index]['videoUrl'],
            filmName: items[index]['filmName'],
            size: size,
            likes: items[index]['likes'],
            comments: items[index]['comments'],
            shares: items[index]['shares'],
          );
        }),
      ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String filmName;
  final String likes;
  final String comments;
  final String shares;

  VideoPlayerItem(
      {Key key,
        @required this.size,
        this.filmName,
        this.likes,
        this.comments,
        this.shares,
        this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  decoration: BoxDecoration(color: black),
                  child: Column(
                    children: <Widget>[
                      Container(
                      height: 240.0,
                      padding: EdgeInsets.only(bottom: 15.0),
                      alignment: Alignment(0.0, 1.0),
                      child: Container(
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl),
                                flags: YoutubePlayerFlags(
                                  autoPlay: true,
                                )),
                            showVideoProgressIndicator: true,
                          ))),
                      Container(
                        child: Text(widget.filmName,
                          style: TextStyle(
                              color: white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: VideoDescription(),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -170.0,
                  top: -100.0,
                  child: Container(
                    height: widget.size.height,
                    width: widget.size.width,
                      child: Column(
                        children: <Widget>[
                          RightPanel(
                            size: widget.size,
                            likes: "${widget.likes}",
                            comments: "${widget.comments}",
                            shares: "${widget.shares}",
                          )
                        ],
                      )
                  ),
                ),
              ],
            )),
      ),
    );
  }
}