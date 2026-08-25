import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/camera_data.dart';
import 'camera_player.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  String? selectedStage;

  bool _exitDialogShowing = false;

  AppLifecycleState? _lastLifecycleState;

  int _resumeGeneration = 0;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    debugPrint('CCTV HOME: HomeScreen initialized');
  }

  // ============================================================
  // APP LIFECYCLE
  // ============================================================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    debugPrint('CCTV APP LIFECYCLE: $state');

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      debugPrint('CCTV APP: BACKGROUND');

      _lastLifecycleState = state;
      return;
    }

    if (state == AppLifecycleState.resumed) {
      debugPrint('CCTV APP: RESUMED');

      if (_lastLifecycleState == AppLifecycleState.paused ||
          _lastLifecycleState == AppLifecycleState.inactive) {
        _restartVisibleCameras();
      }

      _lastLifecycleState = AppLifecycleState.resumed;
    }
  }

  // ============================================================
  // RESTART CAMERAS AFTER RESUME
  // ============================================================

  void _restartVisibleCameras() {
    if (!mounted) return;

    debugPrint('CCTV: RESTARTING CAMERA PLAYERS');

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        _resumeGeneration++;
      });

      debugPrint('CCTV: CAMERA RESTART GENERATION = $_resumeGeneration');
    });
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  // ============================================================
  // STAGES
  // ============================================================

  List<String> get stages {
    final result = cameraList.map((camera) => camera.stage).toSet().toList();

    result.sort();

    return result;
  }

  // ============================================================
  // CAMERAS FOR SELECTED STAGE
  // ============================================================

  List<CameraData> get camerasForSelectedStage {
    if (selectedStage == null) {
      return [];
    }

    return cameraList.where((camera) => camera.stage == selectedStage).toList();
  }

  // ============================================================
  // STAGE CHANGE
  // ============================================================

  void onStageChanged(String? stage) {
    if (!mounted) return;

    // ----------------------------------------------------------
    // Stop currently active players before switching stage.
    // This prevents old RTSP streams from remaining alive.
    // ----------------------------------------------------------

    CameraPlayer.stopAllPlayers().catchError((error) {
      debugPrint('STAGE CHANGE: Camera cleanup error: $error');
    });

    setState(() {
      selectedStage = stage;
      _resumeGeneration++;
    });

    debugPrint('CCTV: SELECTED STAGE = $selectedStage');
  }

  // ============================================================
  // FULL SCREEN CAMERA
  // ============================================================

  void openFullScreen(CameraData camera) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FullScreenCamera(camera: camera)),
    );
  }

  // ============================================================
  // EXIT DIALOG
  // ============================================================

  Future<bool> _showExitDialog() async {
    if (_exitDialogShowing) {
      return false;
    }

    _exitDialogShowing = true;

    try {
      final shouldExit = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text(
              'Exit CCTV Monitor?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(false);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop(true);
                },
                child: const Text('Exit'),
              ),
            ],
          );
        },
      );

      return shouldExit == true;
    } finally {
      _exitDialogShowing = false;
    }
  }

  // ============================================================
  // BACK
  // ============================================================

  Future<void> _handleBackPress() async {
    if (!mounted) return;

    final shouldExit = await _showExitDialog();

    if (!shouldExit) {
      return;
    }

    if (!mounted) return;

    // ----------------------------------------------------------
    // Camera cleanup is intentionally NOT awaited.
    // App exit must not depend on RTSP/player cleanup.
    // ----------------------------------------------------------

    try {
      CameraPlayer.stopAllPlayers().catchError((error) {
        debugPrint('BACK: Camera cleanup error: $error');
      });
    } catch (e) {
      debugPrint('BACK: Camera cleanup exception: $e');
    }

    // ----------------------------------------------------------
    // Android exit
    // ----------------------------------------------------------

    await SystemNavigator.pop();
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  Future<void> _logout() async {
    if (!mounted) return;

    final shouldLogout = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (shouldLogout != true) {
      return;
    }

    // ----------------------------------------------------------
    // CLEAR LOGIN SESSION
    // ----------------------------------------------------------

    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.clear();

      debugPrint('LOGOUT: SharedPreferences cleared');
    } catch (e) {
      debugPrint('LOGOUT: Session clear error: $e');
    }

    if (!mounted) return;

    // ----------------------------------------------------------
    // CAMERA CLEANUP
    // ----------------------------------------------------------

    try {
      CameraPlayer.stopAllPlayers().catchError((error) {
        debugPrint('LOGOUT: Camera cleanup error: $error');
      });
    } catch (e) {
      debugPrint('LOGOUT: Camera cleanup exception: $e');
    }

    // ----------------------------------------------------------
    // GO LOGIN IMMEDIATELY
    // ----------------------------------------------------------

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final cameras = camerasForSelectedStage;

    return PopScope(
      canPop: false,

      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          return;
        }

        _handleBackPress();
      },

      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F8),

        // ======================================================
        // APP BAR
        // ======================================================
        appBar: AppBar(
          title: const Text(
            'CCTV Monitor',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),

          centerTitle: true,

          backgroundColor: const Color(0xFF0057B8),

          foregroundColor: Colors.white,

          leading: IconButton(
            tooltip: 'Back',
            onPressed: _handleBackPress,
            icon: const Icon(Icons.arrow_back),
          ),

          actions: [
            IconButton(
              tooltip: 'Logout',
              onPressed: _logout,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),

        // ======================================================
        // BODY
        // ======================================================
        body: SafeArea(
          child: Column(
            children: [
              // ==================================================
              // STAGE DROPDOWN
              // ==================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Stage',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedStage,

                      isExpanded: true,

                      decoration: InputDecoration(
                        hintText: 'Select Stage',

                        prefixIcon: const Icon(Icons.factory),

                        filled: true,

                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      items: stages.map((stage) {
                        return DropdownMenuItem<String>(
                          value: stage,
                          child: Text(stage),
                        );
                      }).toList(),

                      onChanged: onStageChanged,
                    ),
                  ],
                ),
              ),

              // ==================================================
              // CAMERA LIST
              // ==================================================
              Expanded(
                child: selectedStage == null
                    ? _emptyState(
                        Icons.factory,
                        'Select a stage to view cameras',
                      )
                    : cameras.isEmpty
                    ? _emptyState(
                        Icons.videocam_off,
                        'No cameras found for this stage',
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),

                        // Keep this small so Flutter doesn't
                        // create a large number of RTSP players.
                        cacheExtent: 50,

                        itemCount: cameras.length,

                        itemBuilder: (context, index) {
                          final camera = cameras[index];

                          return _LazyCameraCard(
                            key: ValueKey(
                              '${camera.rtspUrl}_'
                              '$_resumeGeneration',
                            ),

                            camera: camera,

                            onFullScreen: () {
                              openFullScreen(camera);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _emptyState(IconData icon, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.blueGrey.shade300),

          const SizedBox(height: 14),

          Text(
            message,
            style: TextStyle(color: Colors.blueGrey.shade600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

// =================================================================
// LAZY CAMERA CARD
// =================================================================

class _LazyCameraCard extends StatefulWidget {
  final CameraData camera;
  final VoidCallback onFullScreen;

  const _LazyCameraCard({
    super.key,
    required this.camera,
    required this.onFullScreen,
  });

  @override
  State<_LazyCameraCard> createState() => _LazyCameraCardState();
}

class _LazyCameraCardState extends State<_LazyCameraCard> {
  bool _shouldStartPlayer = false;

  @override
  void initState() {
    super.initState();

    // Wait until the card has actually been inserted
    // into the widget tree before creating the player.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setState(() {
        _shouldStartPlayer = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),

      elevation: 3,

      clipBehavior: Clip.antiAlias,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ======================================================
          // HEADER
          // ======================================================
          InkWell(
            onTap: widget.onFullScreen,

            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 10, 10),

              child: Row(
                children: [
                  const Icon(Icons.videocam, size: 21),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      widget.camera.cameraName,

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),

                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  _PortBadge(port: widget.camera.port),
                ],
              ),
            ),
          ),

          // ======================================================
          // VIDEO
          // ======================================================
          AspectRatio(
            aspectRatio: 16 / 9,

            child: _shouldStartPlayer
                ? CameraPlayer(
                    key: ValueKey(widget.camera.rtspUrl),
                    rtspUrl: widget.camera.rtspUrl,
                  )
                : Container(
                    color: Colors.black,

                    child: const Center(
                      child: Text(
                        'Waiting...',
                        style: TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                    ),
                  ),
          ),

          // ======================================================
          // FULL SCREEN
          // ======================================================
          InkWell(
            onTap: widget.onFullScreen,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Icon(
                    Icons.fullscreen,
                    size: 19,
                    color: Colors.blueGrey.shade600,
                  ),

                  const SizedBox(width: 5),

                  Text(
                    'Tap for full screen',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =================================================================
// PORT BADGE
// =================================================================

class _PortBadge extends StatelessWidget {
  final String port;

  const _PortBadge({required this.port});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(
        port,

        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =================================================================
// FULL SCREEN CAMERA
// =================================================================

class FullScreenCamera extends StatefulWidget {
  final CameraData camera;

  const FullScreenCamera({super.key, required this.camera});

  @override
  State<FullScreenCamera> createState() => _FullScreenCameraState();
}

class _FullScreenCameraState extends State<FullScreenCamera> {
  bool _isLandscape = true;

  @override
  void initState() {
    super.initState();

    _openLandscape();
  }

  // ============================================================
  // LANDSCAPE
  // ============================================================

  Future<void> _openLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    if (!mounted) return;

    setState(() {
      _isLandscape = true;
    });
  }

  // ============================================================
  // PORTRAIT
  // ============================================================

  Future<void> _openPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (!mounted) return;

    setState(() {
      _isLandscape = false;
    });
  }

  // ============================================================
  // TOGGLE
  // ============================================================

  Future<void> _toggleOrientation() async {
    if (_isLandscape) {
      await _openPortrait();
    } else {
      await _openLandscape();
    }
  }

  // ============================================================
  // BACK
  // ============================================================

  Future<void> _goBack() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (!mounted) return;

    Navigator.pop(context);
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;

        _goBack();
      },

      child: Scaffold(
        backgroundColor: Colors.black,

        body: SafeArea(
          child: Column(
            children: [
              // ==================================================
              // HEADER
              // ==================================================
              Container(
                height: 56,
                color: Colors.black,

                child: Row(
                  children: [
                    IconButton(
                      onPressed: _goBack,
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),

                    Expanded(
                      child: Text(
                        widget.camera.cameraName,

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(right: 8),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        borderRadius: BorderRadius.circular(7),
                      ),

                      child: Text(
                        widget.camera.port,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: _toggleOrientation,

                      tooltip: _isLandscape ? 'Portrait' : 'Landscape',

                      icon: Icon(
                        _isLandscape ? Icons.fullscreen_exit : Icons.fullscreen,

                        color: Colors.white,

                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // VIDEO
              // ==================================================
              Expanded(
                child: SizedBox.expand(
                  child: CameraPlayer(
                    key: ValueKey(widget.camera.rtspUrl),
                    rtspUrl: widget.camera.rtspUrl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
