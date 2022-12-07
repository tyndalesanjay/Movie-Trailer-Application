import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/interfaces/movie_interface.dart';
import 'package:video_player/video_player.dart';
import '../../services/movie_services.dart';
import '../../utilities/magic_strings.dart';
import 'moviePlayer_utilities.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({super.key, required this.title, required this.movies});
  final String title;
  final Movies movies;

  @override
  State<MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  final MovieService api = MovieService();
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.network(widget.movies.videoLink);
    //set initial Orientation to landscape
    autoLandScape();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return Material(
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data ?? false) {
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio * 33 / 27,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_videoPlayerController),
                    ControlsOverlay(
                      controller: _videoPlayerController,
                      title: '${widget.movies.videoName}',
                    ),
                    VideoProgressIndicator(_videoPlayerController,
                        allowScrubbing: true),
                  ],
                ),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}
