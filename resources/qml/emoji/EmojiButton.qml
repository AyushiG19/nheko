import "../"
import QtQuick 2.15
import QtQuick.Controls 2.1
import im.nheko 1.0
import im.nheko.EmojiModel 1.0

ImageButton {
    id: emojiButton

    property var colors: currentActivePalette
    property var emojiPicker
    property string event_id

    image: ":/icons/icons/ui/smile.png"
    onClicked: emojiPicker.visible ? emojiPicker.close() : emojiPicker.show(emojiButton, function(emoji) {
        TimelineManager.queueReactionMessage(event_id, emoji);
    })
}
