import "./ui"
import QtQuick 2.15
import QtQuick.Controls 2.3

AbstractButton {
    id: button

    property alias cursor: mouseArea.cursorShape
    property string image: undefined
    property color highlightColor: colors.highlight
    property color buttonTextColor: colors.buttonText
    property bool changeColorOnHover: true

    focusPolicy: Qt.NoFocus
    width: 16
    height: 16

    Image {
        id: buttonImg

        // Workaround, can't get icon.source working for now...
        anchors.fill: parent
        source: image != "" ? ("image://colorimage/" + image + "?" + ((button.hovered && changeColorOnHover) ? highlightColor : buttonTextColor)) : ""
    }

    HoverHandler {
        id: mouseArea

        cursorShape: Qt.PointingHandCursor
    }

    Ripple {
        color: Qt.rgba(buttonTextColor.r, buttonTextColor.g, buttonTextColor.b, 0.5)
        clip: false
        rippleTarget: button
    }

}
