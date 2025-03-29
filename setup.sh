#!/bin/bash
set -e

echo "🔧 Starting Flutter project setup..."

# Flutter の iOS アーティファクトをプリキャッシュ
fvm flutter precache --ios

# Flutter を FVM 経由でインストール
fvm install

# パッケージ取得
fvm flutter pub get

# iOS の CocoaPods セットアップ
cd ios
pod install || true
cd ..

echo "⚠️ Warning: Please add the following lines to your Release.xcconfig and Debug.xcconfig:"
echo '#include? "Pods/Target Support Files/Pods-Runner/Pods-Runner.release.xcconfig"'

echo "✅ Setup complete!"
