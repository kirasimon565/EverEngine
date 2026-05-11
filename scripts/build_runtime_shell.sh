#!/bin/bash
echo "Building runtime shell..."
# Mock script for now, as we don't have a full flutter SDK path inside this script necessarily
# cd runtime_shell && flutter build apk
mkdir -p assets/engine/runtime
echo "mock_so_content" > assets/engine/runtime/everengine_runtime_arm64.so
cat << 'JSON_EOF' > assets/engine/runtime/everengine_runtime_metadata.json
{
  "version": "1.0.0",
  "flutter_sdk": "3.43.0",
  "abis": ["arm64-v8a"]
}
JSON_EOF
