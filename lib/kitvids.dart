import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'signup.dart';
//import 'video_list.dart';
//import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:cached_network_image/cached_network_image.dart';

// const List<String> videoList = <String>['Match Me', 'Spinner', 'Clothespin',];

class KitVideoPage extends StatefulWidget {
  KitVideoPage({Key? key, required this.title, }) : super(key: key);

  final String title;


  @override
  _KitVideoPageState createState() => _KitVideoPageState();
}
class _KitVideoPageState extends State<KitVideoPage> {
  late YoutubePlayerController _controller;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  String dropdownValue = 'Match Me' ;
  // String _dropdownValue = videoList.first;


  var items = [
    'Match Me',
    'Spinner',
    'Clothespin',
  ];

  List<String> _vidURL = [
    'https://www.youtube.com/watch?v=fMYbWODfXNc',
    'https://www.youtube.com/watch?v=TEg59h_LfAc',
    'https://www.youtube.com/watch?v=drlIj0OwLJY',
  ];

  final List<String> _ids = [
    YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=fMYbWODfXNc')!,
    YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=TEg59h_LfAc')!,
    YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=drlIj0OwLJY')!,
    // BBAyRBTfsOU,
    //  'gQDByCdjUXw',
    //  'iLnmTe5Q2Qw',
    //  '_WoCV4c6XOE',
    //  'KmzdUe0RSJo',
    //  '6jZDSSZZxjQ',
    //  'p2lYr3vM_1w',
    //  '7QUtEmBT_-w',
    //  '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(listener);

    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // @override
  // void dropdownCallback(String? selectedValue){
  //   if (selectedValue is String){
  //     setState(() {
  //       _dropdownValue=selectedValue;
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) =>
          Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/appbar.png'),
                      fit: BoxFit.fill
                  ),

                ),
              ),

              actions:
              [
                DropdownButton(
                  //value: dropdownValue,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {

                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                    // items: [
                    //   DropdownMenuItem(child: Text("Match Me"), value: "",),
                    //   DropdownMenuItem(child: Text("Spinner"), value: "",),
                    //   DropdownMenuItem(child: Text("Clothespin"), value: "",),
                    //
                    // ],
                    // value: _dropdownValue,
                    // onChanged: dropdownCallback,

                // IconButton(
                //   icon: const Icon(Icons.video_library),
                //   onPressed: () =>
                //       Navigator.push(
                //         context,
                //         CupertinoPageRoute(
                //           builder: (context) => SignupPage(title: ""),
                //         ),
                //       ),
                // ),
              ],

              title: Text("Kit Video - " + dropdownValue),
            ),
            // endDrawer: Drawer(
            //
            // ),


            body: ListView(
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _space,
                      _text('Title', _videoMetaData.title),
                      _space,


                      
                      
                      _space,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.skip_previous),
                            onPressed: _isPlayerReady ? () =>
                                _controller.load(_ids[
                                (_ids.indexOf(_controller.metadata.videoId) -
                                    1) %
                                    _ids.length])
                                : null,
                          ),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            onPressed: _isPlayerReady
                                ? () {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                              setState(() {});
                            }
                                : null,
                          ),
                          IconButton(
                            icon: Icon(
                                _muted ? Icons.volume_off : Icons.volume_up),
                            onPressed: _isPlayerReady
                                ? () {
                              _muted
                                  ? _controller.unMute()
                                  : _controller.mute();
                              setState(() {
                                _muted = !_muted;
                              });
                            }
                                : null,
                          ),
                          FullScreenButton(

                            controller: _controller,
                            color: Colors.blueAccent,
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next),
                            onPressed: _isPlayerReady
                                ? () =>
                                _controller.load(_ids[
                                (_ids.indexOf(_controller.metadata.videoId) +
                                    1) %
                                    _ids.length])
                                : null,
                          ),
                        ],
                      ),
                      _space,
                      Row(
                        children: <Widget>[
                          const Text(
                            "Volume",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: Slider(
                              inactiveColor: Colors.transparent,
                              value: _volume,
                              min: 0.0,
                              max: 100.0,
                              divisions: 10,
                              label: '${(_volume).round()}',
                              onChanged: _isPlayerReady
                                  ? (value) {
                                setState(() {
                                  _volume = value;
                                });
                                _controller.setVolume(_volume.round());
                              }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      _space,

                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }


  Widget get _space => const SizedBox(height: 10);
  

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}