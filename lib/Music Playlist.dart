import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/youtube/v3.dart' as youtube;

final String _clientId = 'YOUR_CLIENT_ID_HERE';
final String _clientSecret = 'YOUR_CLIENT_SECRET_HERE';
final String _accessToken = 'YOUR_ACCESS_TOKEN_HERE';
final String _refreshToken = 'YOUR_REFRESH_TOKEN_HERE';

final _credentials = auth.AccessCredentials(
    // The 0s are placeholders, will be filled in with authentication info for test account made through Google Cloud
    // This test account will allow us to authenticate with Google API without requiring users to log in themselves
    auth.AccessToken(_accessToken, "0", 0 as DateTime),
    _refreshToken,
    ['https://www.googleapis.com/auth/youtube']);

// errors here to be figured out later, the first is because await is being used outside of a function and can only be
//  used in async function
//final _client = youtube.YouTubeApi(await auth.clientViaCredentials(_credentials));

class MusicPlaylist extends StatefulWidget {
  final String playlistId;

  const MusicPlaylist({this.playlistId = 'default_id', Key? key}) : super(key: key);

  @override
  _MusicPlaylistState createState() => _MusicPlaylistState();
}

class _MusicPlaylistState extends State<MusicPlaylist> {
  // Declares the _controller variable and initializes it later in the initState method
  late YoutubePlayerController _controller;

  // Declares the _playlistItems list and initializes it later in the _getPlaylistItems method
  late List<dynamic> _playlistItems;

  @override
  void initState() {
    super.initState();
    _playlistItems = []; // initialize the field with an empty list

    // Initializes the _controller variable with default flags in mute mode and auto play mode off
    _controller = YoutubePlayerController(
      initialVideoId: '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    // Calls the _getPlaylistItems method to fetch the playlist items from the YouTube API and store them in _playlistItems
    _getPlaylistItems();
  }

  Future<void> _getPlaylistItems() async {
    // Placeholder for Google API Key
    final String apiKey = 'YOUR_API_KEY_HERE';
    // Placeholder for playlist URL
    final String url = 'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=${widget.playlistId}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    // Initializes the _playlistItems list with the items returned from the YouTube API
    _playlistItems = data['items'];

    // Notifies the framework that the state of this object has changed and that the UI should be rebuilt
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),

          // Creates a ListView.builder widget with a dynamic number of ListTiles
          Expanded(
            child: ListView.builder(
              itemCount: _playlistItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _playlistItems[index]['snippet'];

                // Returns a ListTile for each playlist item, displaying its title and description
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                  onTap: () {
                    // Loads the video with the ID of the selected playlist item into the player
                    _controller.load(item['resourceId']['videoId']);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}