#!/bin/bash
# Copies the otp/utm TOTP code from pass and says so. pass -c doesn't print the
# code and clears the clipboard after 45s. Used by the widget and Super+Shift+U.
case "${LC_ALL:-${LC_MESSAGES:-$LANG}}" in
  ru*) ok="Код скопирован в буфер обмена"; fail="Не удалось получить код otp/utm из pass" ;;
  *) ok="Code copied to clipboard"; fail="pass otp otp/utm failed" ;;
esac
if pass otp -c otp/utm >/dev/null; then
  notify-send "UTM OTP" "$ok"
else
  notify-send -u critical "UTM OTP" "$fail"
fi
