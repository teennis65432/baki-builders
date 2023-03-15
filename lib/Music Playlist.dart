import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getPlaylistItems(String playlistId) async {
  final String apiKey = 'YOUR_API_KEY_HERE';
  final String url = 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=$playlistId&key=$apiKey';

  final response = await http.get(Uri.parse(url));
  final data = jsonDecode(response.body);
  final List<dynamic> playlistItems = data['items'];

  print(playlistItems);
}

class Music_Playlist extends StatelessWidget {
  const Music_Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'YOUR_VIDEO_ID_HERE',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
      ),
      body: Column(
    children: [
    YoutubePlayer(
    controller: _controller,
      showVideoProgressIndicator: true,
    ),
    Expanded(
    child: ListView.builder(
    //itemCount: _playlistItems.length,
    itemBuilder: (BuildContext context, int index) {
    return ListTile(
    //title: Text(_playlistItems[index].title),
    //subtitle: Text(_playlistItems[index].description),
    );
    },  // itemBuilder
    ),
    ),
    ],  // children
    ),
    );
  }  // build widget
}  // class