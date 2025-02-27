#!/bin/bash

set -e  # Exit on error

cd "$(dirname "$0")/.." || exit

# Store the current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Generate documentation in the current branch
rm -rf docs
xcrun xcodebuild docbuild \
    -scheme SwiftSafeUI \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/SwiftSafeUI.doccarchive" \
    --output-path "docs" \
    --hosting-base-path "SwiftSafeUI"

echo '<script>window.location.href += "/documentation/swiftsafeui"</script>' > docs/index.html

# Switch to docs branch, bringing uncommitted changes
git fetch origin docs || true
git checkout docs 2>/dev/null || git checkout -b docs
git pull origin docs --ff-only

# Commit and push only on the docs branch
git add -f docs  # Force add in case of ignored files
git commit -m "Update documentation"
git push origin docs

# Switch back to the original branch
git checkout "$CURRENT_BRANCH"
