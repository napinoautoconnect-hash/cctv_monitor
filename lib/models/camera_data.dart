class CameraData {
  final String stage;
  final String cameraName;
  final String rtspUrl;
  final String port;

  const CameraData({
    required this.stage,
    required this.cameraName,
    required this.rtspUrl,
    required this.port,
  });
}

const List<CameraData> cameraList = [
  // ============================================================
  // AWP
  // ============================================================
  CameraData(
    stage: 'AWP',
    cameraName: 'WIP Old',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=17&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'AWP',
    cameraName: 'CAM 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=2&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'AWP',
    cameraName: 'Channel29',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=29&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'AWP',
    cameraName: 'AWP-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=30&subtype=0',
    port: '45',
  ),

  // ============================================================
  // WIP
  // ============================================================
  CameraData(
    stage: 'WIP',
    cameraName: 'WIP Lift Opposite',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1901',
    port: '43',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'WIP Near REML Line',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2201',
    port: '43',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'Locker Room 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=5&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'Locker Room 3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=6&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'CAM 7',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=7&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'CAM 11',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=11&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'WIP Area New',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=17&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'WIP',
    cameraName: 'WIP Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=25&subtype=0',
    port: '45',
  ),

  // ============================================================
  // MWH ASSY
  // ============================================================
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'PDI Conv 5',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/601',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv 5',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/701',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv 7 ET',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/801',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv 1 Wire Assembly',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/901',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv 1',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1001',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv 3 BOP Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1101',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv 7 ET Test',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1701',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'Drinking Water Tr Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/3001',
    port: '43',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'Wire Assembly Conveyor-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=1&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv-7',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=12&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conveyor No-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=13&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'Maintenance Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=14&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conveyor No-5',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=16&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'ET Conveyor No-4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=18&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'Gogoro Line',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=19&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Offline First-Floor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=20&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'Offline MWH',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=23&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conv-6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=26&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'REML-Line',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=28&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conveyor No-4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=31&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'CAM 4',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=4&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'CAM 5',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=5&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'CAM 8',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=8&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'CAM 9',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=9&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'CAM 12',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=12&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'MWH Conveyor-6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=12&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'MWH Assy',
    cameraName: 'PDI Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=19&subtype=0',
    port: '45',
  ),

  // ============================================================
  // SWITCH ASSY
  // ============================================================
  CameraData(
    stage: 'Switch Assy',
    cameraName: 'Switch Scrap Area',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2501',
    port: '43',
  ),
  CameraData(
    stage: 'Switch Assy',
    cameraName: 'Old Switch Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=21&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Switch Assy',
    cameraName: 'Switch Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=28&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Switch Assy',
    cameraName: 'Material Lift',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=31&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Switch Assy',
    cameraName: 'Switch Padprinting',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=32&subtype=0',
    port: '45',
  ),

  // ============================================================
  // ED SHOP FLOOR
  // ============================================================
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED Testing',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/301',
    port: '43',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED Testing-2',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2001',
    port: '43',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED Final',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2101',
    port: '43',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED USB Quality Desk',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=30&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED Testing',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=32&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED Corridor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=3&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'SMT-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=4&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'SMT-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=5&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'Throughhole-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=6&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'SMT-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=7&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'Through-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=8&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'Edtesting-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=11&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'ED Shop Floor',
    cameraName: 'ED Operator Att M/C',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=13&subtype=0',
    port: '45',
  ),

  // ============================================================
  // STORE MWH
  // ============================================================
  CameraData(
    stage: 'Store MWH',
    cameraName: 'Store Hydrolic Lifter',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/101',
    port: '43',
  ),
  CameraData(
    stage: 'Store MWH',
    cameraName: 'Store',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/201',
    port: '43',
  ),
  CameraData(
    stage: 'Store MWH',
    cameraName: 'FG-3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=15&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Store MWH',
    cameraName: 'FG-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=16&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Store MWH',
    cameraName: 'FG Packing-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=18&subtype=0',
    port: '45',
  ),

  // ============================================================
  // STORE ED
  // ============================================================
  CameraData(
    stage: 'Store ED',
    cameraName: 'Pcb ED Store',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2601',
    port: '43',
  ),

  // ============================================================
  // DOCK
  // ============================================================
  CameraData(
    stage: 'Dock',
    cameraName: 'Store Unloading',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/401',
    port: '43',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'Material Unloading-2',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2301',
    port: '43',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'Dispatch Loading',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2901',
    port: '43',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'Dispatch Bin Storage',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=2&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'BOP Scrap Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=29&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'Out Source Loading',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=14&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'FG Loading',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=21&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Dock',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=27&subtype=0',
    port: '45',
  ),

  // ============================================================
  // OUTER PERIPHERY & GATES
  // ============================================================
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'LPG Storage Parking',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1801',
    port: '43',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Material Gate',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2701',
    port: '43',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Parking North Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2801',
    port: '43',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Entry Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=7&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'DG Area 1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=9&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'DG Area 2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=10&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Maingate Entrance North',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=25&subtype=1',
    port: '42',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'CAM 10',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=10&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Park/Diesel Yard',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=1&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Maingate Security',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=22&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=24&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Outer Periphery & Gates',
    cameraName: 'Scrap Yard-1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=26&subtype=0',
    port: '45',
  ),

  // ============================================================
  // OFFICE GROUND FLOOR
  // ============================================================
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'Plant Head Sir Office',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=3&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'Temple Area',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=8&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'AWP Entrance Gate',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=15&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'IT/HR Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=24&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'Lift Panel',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=27&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'CAM 1',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=1&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'Reception',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=2&subtype=0',
    port: '45',
  ),
  CameraData(
    stage: 'Office Ground Floor',
    cameraName: 'Auditorium Gallery',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=10&subtype=0',
    port: '45',
  ),

  // ============================================================
  // OFFICE 1ST FLOOR
  // ============================================================
  CameraData(
    stage: 'Office 1St Floor',
    cameraName: 'MD Room Coridoor',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/2401',
    port: '43',
  ),
  CameraData(
    stage: 'Office 1St Floor',
    cameraName: 'ED Office',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=4&subtype=0',
    port: '42',
  ),
  CameraData(
    stage: 'Office 1St Floor',
    cameraName: 'CAM 3',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=3&subtype=0',
    port: '44',
  ),
  CameraData(
    stage: 'Office 1St Floor',
    cameraName: 'CAM 6',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.44:554/cam/realmonitor?channel=6&subtype=0',
    port: '44',
  ),

  // ============================================================
  // MAINTENANCE
  // ============================================================
  CameraData(
    stage: 'Maintenance',
    cameraName: 'Panel Room Utility',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1201',
    port: '43',
  ),
  CameraData(
    stage: 'Maintenance',
    cameraName: 'Transformer East Side',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1301',
    port: '43',
  ),
  CameraData(
    stage: 'Maintenance',
    cameraName: 'Chiller Room',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=11&subtype=0',
    port: '42',
  ),

  // ============================================================
  // PREMISES OUTSIDE
  // ============================================================
  CameraData(
    stage: 'Premises Outside',
    cameraName: 'Channel20',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=20&subtype=0',
    port: '45',
  ),

  // ============================================================
  // CANTEEN
  // ============================================================
  CameraData(
    stage: 'Canteen',
    cameraName: 'Canteen',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/501',
    port: '43',
  ),
  CameraData(
    stage: 'Canteen',
    cameraName: 'Canteen Punching M/C Counter',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1401',
    port: '43',
  ),
  CameraData(
    stage: 'Canteen',
    cameraName: 'Canteen-2',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=9&subtype=0',
    port: '45',
  ),

  // ============================================================
  // TRAINING ROOM
  // ============================================================
  CameraData(
    stage: 'Training Room',
    cameraName: 'Lift & Training Room',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1501',
    port: '43',
  ),
  CameraData(
    stage: 'Training Room',
    cameraName: 'TTC First Floor',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.42:554/cam/realmonitor?channel=22&subtype=0',
    port: '42',
  ),

  // ============================================================
  // REWORK AREAS
  // ============================================================
  CameraData(
    stage: 'Rework Areas',
    cameraName: 'Outsource Rework',
    rtspUrl:
        'rtsp://admin:Napino%402024@61.12.34.43:554/Streaming/Channels/1601',
    port: '43',
  ),

  // ============================================================
  // TERRACE
  // ============================================================
  CameraData(
    stage: 'Terrace',
    cameraName: 'Solder M/C Roof',
    rtspUrl:
        'rtsp://admin:admin%40123@61.12.34.45:554/cam/realmonitor?channel=23&subtype=0',
    port: '45',
  ),
];
