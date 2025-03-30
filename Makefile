# Flutter with FVM 用 Makefile
setup:
	chmod +x setup.sh
	./setup.sh


# FVM を使って Flutter をインストール
install:
	fvm install

list:
	fvm list

# pub get (依存関係取得)
get:
	fvm flutter pub get

build_runner:
	fvm flutter  pub run build_runner build --delete-conflicting-outputs

# clean (ビルドキャッシュ削除)
clean:
	fvm flutter clean

# iOS のビルドキャッシュや派生ファイルの削除
ios-clean:
	rm -rf ios/Pods ios/Podfile.lock ios/Flutter/Flutter.framework ios/Flutter/Flutter.podspec
	rm -rf ios/Flutter/App.framework ios/Flutter/Generated.xcconfig
	cd ios && pod deintegrate && pod clean && pod install

# iOS のビルド
ios-build:
	fvm flutter build ios

# Android のビルド
apk:
	fvm flutter build apk

web:
	fvm flutter build web

test:
	fvm flutter test

# Dart の静的解析（コード品質チェック）
lint:
	fvm flutter analyze

# Firebase Hosting への Web アプリデプロイ（事前に build/web が必要）
deploy:
	make web
	firebase deploy --only hosting

# 全部まとめてクリーン＆初期化
reset:
	make clean
	make ios-clean
	make get

.PHONY: setup install list get clean ios-clean ios-build apk web reset
