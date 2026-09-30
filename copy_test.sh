#!/bin/bash
# bash copy_test.sh — runs copy.sh with pass and notify-send stubbed in PATH.
dir=$(mktemp -d); trap 'rm -rf "$dir"' EXIT
printf '#!/bin/sh\nexit $PASS_EXIT\n' > "$dir/pass"
printf '#!/bin/sh\necho "$*" > "%s/notified"\n' "$dir" > "$dir/notify-send"
chmod +x "$dir/pass" "$dir/notify-send"
check() { # pass exit, LANG, expected notify-send args
  PATH="$dir:$PATH" PASS_EXIT=$1 LC_ALL= LC_MESSAGES= LANG=$2 bash "$(dirname "$0")/copy.sh"
  got=$(cat "$dir/notified"); [ "$got" = "$3" ] || { echo "FAIL: $1 $2: got '$got', want '$3'"; exit 1; }
}
check 0 en_US.UTF-8 "UTM OTP Code copied to clipboard"
check 0 ru_RU.UTF-8 "UTM OTP Код скопирован в буфер обмена"
check 1 en_US.UTF-8 "-u critical UTM OTP pass otp otp/utm failed"
echo ok
