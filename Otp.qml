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
    onPressed: function() {
      if (root.bar) root.bar.run(Qt.resolvedUrl("copy.sh").toString().replace(/^file:\/\//, ""))
    }
  }
}
