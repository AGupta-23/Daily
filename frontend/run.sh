#!/bin/bash
# Simple script to run the Daily app

echo "🚀 Starting Daily App..."
echo ""

# Step 1: Get dependencies
echo "📦 Getting dependencies..."
flutter pub get
echo ""

# Step 2: Generate code
echo "🔨 Generating code (this may take a minute)..."
flutter pub run build_runner build --delete-conflicting-outputs
echo ""

# Step 3: Run the app
echo "🎉 Launching app..."
flutter run