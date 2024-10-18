#!/bin/bash

cd "$(dirname "$0")/.." || exit

# Clear derived data
DERIVED_DATA_PATH=$(mktemp -d)

# Build the documentation
xcrun xcodebuild docbuild \
    -scheme SwiftSafeUI \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$DERIVED_DATA_PATH" || exit

xcrun docc process-archive transform-for-static-hosting \
    "$DERIVED_DATA_PATH/Build/Products/Debug-iphonesimulator/SwiftSafeUI.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "SwiftSafeUI"

echo '<script>window.location.href += "/documentation/swiftsafeui"</script>' > .docs/index.html
