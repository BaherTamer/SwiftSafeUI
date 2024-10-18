#!/bin/bash

# Navigate to project root
cd "$(dirname "$0")/.." || exit

# Clear derived data
rm -rf "$PWD/.derivedData"

# Build the documentation
xcrun xcodebuild docbuild \
    -scheme SwiftSafeUI \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData" || exit

# Process documentation for static hosting
xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/SwiftSafeUI.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "SwiftSafeUI" || exit

# Create redirect index.html
echo '<script>window.location.href += "/documentation/swiftsafeui"</script>' > .docs/index.html

echo "Documentation successfully updated."