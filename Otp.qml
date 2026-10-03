import QtQuick
import Quickshell
import qs.Ui
import "I18n.js" as I18n

BarWidget {
  id: root
  moduleName: "predmaxim.otp"

  readonly property var tr: I18n.translator(I18n.textLanguage(Quickshell.env))

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "\uf084"
    tooltipText: root.tr("Copy UTM OTP code")
    onPressed: function() {
      if (root.bar) root.bar.run(Qt.resolvedUrl("copy.sh").toString().replace(/^file:\/\//, ""))
    }
  }
}
