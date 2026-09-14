import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

// const String mediaMtxServer = '14.140.246.38';
const String mediaMtxServer = '172.16.34.43';
const int mediaMtxWebRtcPort = 8889;

String getWhepUrl(String path) {
  return 'http://$mediaMtxServer:$mediaMtxWebRtcPort/$path/whep';
}

class WebRtcCameraPlayer extends StatefulWidget {
  final String whepUrl;

  const WebRtcCameraPlayer({super.key, required this.whepUrl});

  @override
  State<WebRtcCameraPlayer> createState() => _WebRtcCameraPlayerState();
}

class _WebRtcCameraPlayerState extends State<WebRtcCameraPlayer> {
  final RTCVideoRenderer _renderer = RTCVideoRenderer();

  RTCPeerConnection? _peerConnection;

  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    try {
      await _renderer.initialize();

      final configuration = <String, dynamic>{'sdpSemantics': 'unified-plan'};

      _peerConnection = await createPeerConnection(configuration);

      _peerConnection!.onTrack = (RTCTrackEvent event) {
        if (event.streams.isNotEmpty) {
          _renderer.srcObject = event.streams[0];

          if (mounted) {
            setState(() {
              _loading = false;
            });
          }
        }
      };

      final offer = await _peerConnection!.createOffer();

      await _peerConnection!.setLocalDescription(offer);

      final localDescription = await _peerConnection!.getLocalDescription();

      if (localDescription == null) {
        throw Exception('Could not create WebRTC offer');
      }

      final response = await http.post(
        Uri.parse(widget.whepUrl),
        headers: {
          'Content-Type': 'application/sdp',
          'Accept': 'application/sdp',
        },
        body: localDescription.sdp,
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception(
          'MediaMTX WHEP error: ${response.statusCode}\n${response.body}',
        );
      }

      await _peerConnection!.setRemoteDescription(
        RTCSessionDescription(response.body, 'answer'),
      );
    } catch (e) {
      debugPrint('WebRTC ERROR: $e');

      if (mounted) {
        setState(() {
          _loading = false;
          _error = e.toString();
        });
      }
    }
  }

  @override
  void dispose() {
    _renderer.srcObject = null;
    _peerConnection?.close();
    _renderer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(
        child: Text('Camera Error\n$_error', textAlign: TextAlign.center),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        RTCVideoView(
          _renderer,
          objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
        ),

        if (_loading) const CircularProgressIndicator(),
      ],
    );
  }
}
