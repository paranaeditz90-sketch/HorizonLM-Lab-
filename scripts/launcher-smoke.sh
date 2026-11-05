#!/usr/bin/env bash
set -euo pipefail

mkdir -p test-results
APK="$(find upstream/ZalithLauncher/build/outputs/apk/debug -name '*.apk' -type f | head -n 1)"
test -s "$APK" || { echo "ERRO: APK x86_64 ausente"; exit 2; }

APP='com.movtery.zalithlauncher.horizonlm.debug'
adb wait-for-device
adb install -r "$APK"
adb shell pm path "$APP" | grep -q '^package:' || { echo "ERRO: pacote nao instalado"; exit 3; }

for i in 1 2 3; do
  echo "===== ABERTURA $i ====="
  adb shell am force-stop "$APP" || true
  adb logcat -c
  adb shell monkey -p "$APP" -c android.intent.category.LAUNCHER 1 | tee "test-results/start-$i.txt"
  sleep 15
  adb logcat -d -v threadtime > "test-results/logcat-$i.txt"
  if ! adb shell pidof "$APP" | tr -d '\r' | grep -Eq '[0-9]+'; then
    echo "FALHA: processo encerrou na abertura $i"
    exit 4
  fi
  if grep -q 'FATAL EXCEPTION' "test-results/logcat-$i.txt"; then
    echo "FALHA: excecao fatal observada durante abertura $i"
    exit 5
  fi
  adb shell screencap -p /sdcard/horizonlm.png
  adb pull /sdcard/horizonlm.png "test-results/screen-$i.png" >/dev/null
done

echo "PASSOU: aplicativo instalado, tres aberturas sem crash observado."
