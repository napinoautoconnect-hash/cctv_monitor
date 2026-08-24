import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/models/camera_data.dart';
import 'camera_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// =================================================================
// HOME SCREEN STATE
// =================================================================

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  String? selectedStage;

  bool _exitDialogShowing = false;

  // ============================================================
  // APP LIFECYCLE
  // ============================================================

  AppLifecycleState? _lastLifecycleState;

  // Every time app resumes, this value changes.
  //
  // Camera cards use this value in their key.
  //
  // Therefore:
  //
  // Android Home button
  //       ↓
  // App goes background
  //       ↓
  // User opens app again
  //       ↓
  // resume detected
  //       ↓
  // CameraPlayer gets fresh key
  //       ↓
  // CameraPlayer recreated
  //       ↓
  // RTSP starts again
  //
  int _resumeGeneration = 0;

  // ============================================================
  // INIT STATE
  // ============================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  // ============================================================
  // APP LIFECYCLE CHANGE
  // ============================================================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    debugPrint('CCTV APP LIFECYCLE: $state');

    // ----------------------------------------------------------
    // APP GOING TO BACKGROUND
    // ----------------------------------------------------------

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      debugPrint('CCTV APP: BACKGROUND');

      _lastLifecycleState = state;

      return;
    }

    // ----------------------------------------------------------
    // APP RETURNED TO FOREGROUND
    // ----------------------------------------------------------

    if (state == AppLifecycleState.resumed) {
      debugPrint('CCTV APP: RESUMED');

      // Only refresh camera players if app actually came
      // from background.
      if (_lastLifecycleState == AppLifecycleState.paused ||
          _lastLifecycleState == AppLifecycleState.inactive) {
        _restartVisibleCameras();
      }

      _lastLifecycleState = state;
    }
  }

  // ============================================================
  // RESTART VISIBLE CAMERAS
  // ============================================================

  void _restartVisibleCameras() {
    if (!mounted) return;

    debugPrint('CCTV: RESTARTING CAMERA PLAYERS AFTER RESUME');

    // Small delay gives Android / Flutter time to restore
    // Surface / Activity before recreating video widgets.
    Future.delayed(const Duration(milliseconds: 300), () {
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
    // Same order as camera_data.dart.
    return cameraList.map((camera) => camera.stage).toSet().toList();
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

    setState(() {
      selectedStage = stage;
    });
  }

  // ============================================================
  // FULL SCREEN
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
    // Prevent duplicate dialogs.
    if (_exitDialogShowing) {
      return false;
    }

    _exitDialogShowing = true;

    final shouldExit = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Exit CCTV Monitor?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'All camera streams will be stopped before exiting.',
          ),
          actions: [
            // --------------------------------------------------
            // CANCEL
            // --------------------------------------------------
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel'),
            ),

            // --------------------------------------------------
            // EXIT
            // --------------------------------------------------
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

    _exitDialogShowing = false;

    if (shouldExit != true) {
      return false;
    }

    // ==========================================================
    // STOP ALL CAMERA PLAYERS
    // ==========================================================

    debugPrint('EXIT CONFIRMED - STOPPING ALL CAMERA PLAYERS');

    await CameraPlayer.stopAllPlayers();

    debugPrint('ALL CAMERA PLAYERS STOPPED');

    return true;
  }

  // ============================================================
  // HANDLE BACK / EXIT
  // ============================================================

  Future<void> _handleBackPress() async {
    if (!mounted) return;

    final exit = await _showExitDialog();

    if (!exit) {
      return;
    }

    if (!mounted) return;

    // Close Android application.
    await SystemNavigator.pop();
  }

  // =============================================================
  // HANDLE LOG OUT
  // ===========================================================
  Future<void> _logout() async {
    if (!mounted) return;

    // =============================================================
    // LOGOUT CONFIRMATION
    // =============================================================
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

    if (shouldLogout != true) return;

    try {
      // =============================================================
      // 1. STOP ALL CCTV CAMERA PLAYERS
      // =============================================================
      debugPrint('LOGOUT: Stopping all camera players...');

      try {
        await CameraPlayer.stopAllPlayers();
      } catch (e) {
        debugPrint('LOGOUT: Camera cleanup error: $e');
      }

      // =============================================================
      // 2. CLEAR SHARED PREFERENCES
      // =============================================================
      debugPrint('LOGOUT: Clearing local session...');

      final prefs = await SharedPreferences.getInstance();

      await prefs.clear();

      debugPrint('LOGOUT: SharedPreferences cleared.');

      // =============================================================
      // 3. CLOSE CURRENT ACTIVITY / APP
      // =============================================================
      if (!mounted) return;

      debugPrint('LOGOUT: Closing CCTV application...');

      await SystemNavigator.pop();
    } catch (e) {
      debugPrint('LOGOUT ERROR: $e');

      // Even if cleanup has some issue,
      // try to close the application.
      if (mounted) {
        await SystemNavigator.pop();
      }
    }
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

                        // Keep low.
                        cacheExtent: 50,

                        itemCount: cameras.length,

                        itemBuilder: (context, index) {
                          final camera = cameras[index];

                          return _LazyCameraCard(
                            key: ValueKey(
                              '${camera.rtspUrl}_$_resumeGeneration',
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

// =================================================================
// LAZY CAMERA CARD STATE
// =================================================================

class _LazyCameraCardState extends State<_LazyCameraCard> {
  bool _shouldStartPlayer = false;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setState(() {
        _shouldStartPlayer = true;
      });
    });
  }

  // ============================================================
  // BUILD
  // ============================================================

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
          // CAMERA HEADER
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

                  // PORT
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

// =================================================================
// FULL SCREEN STATE
// =================================================================

class _FullScreenCameraState extends State<FullScreenCamera> {
  bool _isLandscape = true;

  // ============================================================
  // INIT
  // ============================================================

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
  // TOGGLE ORIENTATION
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
    // Restore portrait first.
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

                    // PORT
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

                    // ORIENTATION
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
