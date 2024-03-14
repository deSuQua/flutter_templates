.PHONY: firebase-init clean format get upgrade upgrade-major outdated codegen clean-pod install-pod native-splash-create native-splash-remove launcher-icons-create run-dev run-prod build-dev-apk build-prod-apk build-dev-web build-prod-web

clean:
	@echo "Cleaning the project"
	@flutter clean

format:
	@echo "Formatting the code"
	@dart fix --apply .
	@dart format -l 80 --fix .

get:
	@echo "Getting dependencies"
	@flutter pub get

upgrade: get
	@echo "Upgrading dependencies"
	@flutter pub upgrade

upgrade-major: get
	@echo "Upgrading dependencies --major-versions"
	@flutter pub upgrade --major-versions

outdated:
	@flutter pub outdated

codegen: get
	@echo "Running codegeneration"
	@flutter pub run build_runner build --delete-conflicting-outputs --release

clean-pod:
	@echo "Clean ios pod"
	@cd ios && pod deintegrate && rm -rf podfile.lock && cd ..


install-pod: get
	@echo 'Install pod'
	@cd ios && pod install --repo-update && cd ..

run-dev:
	@echo "Running dev app"
	@flutter run -t lib/main-dev.dart --release

run-prod:
	@echo "Running prod app"
	@flutter run -t lib/main-prod.dart --release

build-dev-apk:
	@echo "Build dev apk"
	@flutter build apk -t lib/main-dev.dart --release

build-prod-apk:
	@echo "Build prod apk"
	@flutter build apk -t lib/main-prod.dart --release
