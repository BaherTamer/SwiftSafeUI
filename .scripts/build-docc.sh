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

# Ensure the latest docs branch is available
git fetch origin docs

# Switch to docs branch (without trying to create it)
git checkout docs
git pull origin docs --ff-only

# Commit and push only on the docs branch
git add -f docs  # Force add ignored files
git commit -m "Update documentation"
git push origin docs

# Switch back to the original branch
git checkout "$CURRENT_BRANCH"
