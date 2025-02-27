#!/bin/bash

set -e  # Exit on error

cd "$(dirname "$0")/.." || exit

# Build documentation
xcrun xcodebuild docbuild \
    -scheme SwiftSafeUI \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/SwiftSafeUI.doccarchive" \
    --output-path "docs" \
    --hosting-base-path "SwiftSafeUI"

echo '<script>window.location.href += "/documentation/swiftsafeui"</script>' > docs/index.html

# Commit and push documentation updates
git add docs
git commit -m "Update documentation"
git push origin docs --force  # Force push to ensure sync

# Restore the stashed changes if there was anything stashed
if git stash list | grep -q "Auto stash before switching to docs branch"; then
    git stash pop
fi
