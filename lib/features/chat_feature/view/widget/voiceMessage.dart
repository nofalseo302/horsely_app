import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:just_audio/just_audio.dart';

class VoiceWidget extends StatefulWidget {
  const VoiceWidget({
    super.key,
    required this.url,
    required this.isMine,
  });

  final String url;
  final bool isMine;

  @override
  State<VoiceWidget> createState() => _VoiceWidgetState();
}

class _VoiceWidgetState extends State<VoiceWidget>
    with AutomaticKeepAliveClientMixin {
  final AudioPlayer player = AudioPlayer();
  Duration? get duration => _duration;
  int get durationInSeconds => duration?.inSeconds ?? 0;
  int get durationInMinutes => duration?.inMinutes ?? 0;
  String get getPositionProgress =>
      '${position.inMinutes}:${position.inSeconds.remainder(60)}';
  String get getDurationProgress =>
      '$durationInMinutes:${durationInSeconds.remainder(60)}';

  Duration _position = const Duration();
  Duration _duration = const Duration();
  bool _isPlaying = false;

  initPlayer() async {
    await player.setUrl(widget.url);

    player.positionStream.listen((event) {
      _position = event;
      if (mounted) {
        setState(() {});
      }
      if (_position.inSeconds == _duration.inSeconds) {
        resetPlayer(); // Reset when finished
      }
    });
    player.durationStream.listen((event) {
      if (event != null) {
        _duration = event;
        if (mounted) {
          setState(() {});
        }
      }
    });
    // player.playerStateStream.listen((event) {
    //   _isPlaying = event == PlayerState.isPlaying;
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });
    player.positionStream.listen((event) {
      if (event.inSeconds == _duration.inSeconds) {
        _position = const Duration(seconds: 0);
        if (mounted) {
          setState(() {});
        }
      }
    });
    setState(() {});
  }

  @override
  initState() {
    initPlayer();
    super.initState();
  }

  @override
  dispose() {
    player.dispose();
    super.dispose();
  }

  play() async {
    player.play();
  }

  pause() async {
    await player.pause();
  }

  seekTo(Duration value) async {
    await player.seek(value);
  }

  Duration get position => _position;
  togglePlayer() {
    if (_isPlaying) {
      pause();
    } else {
      play();
    }
  }

  resetPlayer() async {
    await player.seek(Duration.zero); // Seek to the beginning
    await player.pause(); // Pause the player
    setState(() {
      _position = Duration.zero; // Reset position
      _isPlaying = false; // Reset the play state
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: togglePlayer,
            child: Icon(
              _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: 28,
              color: widget.isMine ? AppColors.primaryColor : AppColors.bgGrey,
            ),
          ),
          Text(
            getPositionProgress,
            style: TextStyle(
                color:
                    widget.isMine ? AppColors.primaryColor : AppColors.bgGrey,
                fontSize: 14.0),
          ),
          Expanded(
            child: Slider(
              activeColor:
                  widget.isMine ? AppColors.primaryColor : AppColors.bgGrey,
              inactiveColor: widget.isMine
                  ? AppColors.primaryColor.withOpacity(.2)
                  : AppColors.bgGrey.withOpacity(.2),
              thumbColor: Colors.white,
              min: 0,
              max: duration?.inSeconds.toDouble() ?? 0.0,
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                seekTo(Duration(seconds: value.toInt()));
                if (value == duration?.inSeconds.toDouble()) {}
              },
            ),
          ),
          Text(
            getDurationProgress,
            style: TextStyle(
                color:
                    widget.isMine ? AppColors.primaryColor : AppColors.bgGrey,
                fontSize: 14.0),
          ),
          const SizedBox(width: 5.0),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
