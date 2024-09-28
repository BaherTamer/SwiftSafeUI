#!/bin/bash

cd "$(dirname "$0")/.." || exit

xcrun xcodebuild docbuild \
    -scheme SwiftSafeUI \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/SwiftSafeUI.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "SwiftSafeUI"

echo '<script>window.location.href += "/documentation/swiftsafeui"</script>' > .docs/index.html
