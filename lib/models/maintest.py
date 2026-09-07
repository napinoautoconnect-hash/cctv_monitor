import re

file_path = r"F:\FlutterProjects\cctv_monitor\lib\models\camera_data.dart"

with open(file_path, "r", encoding="utf-8") as file:
    content = file.read()

# zone: '...' ya zone: "..." dono support karega
zones = re.findall(
    r"zone\s*:\s*['\"]([^'\"]+)['\"]",
    content
)

# Duplicate remove + original order maintain
unique_zones = list(dict.fromkeys(zones))

print(f"\nTotal Unique Zones: {len(unique_zones)}\n")
print("=" * 50)

for i, zone in enumerate(unique_zones, start=1):
    print(f"{i}. {zone}")

print("=" * 50)