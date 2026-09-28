import QtQuick
import qs.Ui

BarWidget {
  id: root
  moduleName: "predmaxim.otp"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf084"
    tooltipText: "Copy UTM OTP code"
    // pass -c copies without printing the code and clears the clipboard after 45s.
    onPressed: function() {
      if (root.bar) root.bar.run("pass otp -c otp/utm >/dev/null || notify-send -u critical 'UTM OTP' 'pass otp otp/utm failed'")
    }
  }
}
