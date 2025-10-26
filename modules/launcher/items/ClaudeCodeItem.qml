import "../services"
import qs.components
import qs.services
import qs.config
import QtQuick

Item {
    id: root

    required property var modelData
    required property var list

    implicitHeight: Config.launcher.sizes.itemHeight

    anchors.left: parent?.left
    anchors.right: parent?.right

    StateLayer {
        radius: Appearance.rounding.normal

        function onClicked(): void {
            root.modelData?.onClicked(root.list);
        }
    }

    Item {
        anchors.fill: parent
        anchors.leftMargin: Appearance.padding.larger
        anchors.rightMargin: Appearance.padding.larger
        anchors.margins: Appearance.padding.smaller

        MaterialIcon {
            id: icon

            anchors.verticalCenter: parent.verticalCenter

            text: "terminal"
            color: Colours.palette.m3primary
            font.pointSize: Appearance.font.size.larger
        }

        Column {
            anchors.left: icon.right
            anchors.leftMargin: Appearance.spacing.normal
            anchors.verticalCenter: parent.verticalCenter

            width: parent.width - icon.width - anchors.leftMargin
            spacing: 0

            StyledText {
                text: root.modelData?.prompt?.trim() === ""
                    ? "Launch Claude Code"
                    : "Launch Claude Code with:"
                font.pointSize: Appearance.font.size.normal
            }

            StyledText {
                visible: root.modelData?.prompt?.trim() !== ""
                text: root.modelData?.prompt ?? ""
                font.pointSize: Appearance.font.size.small
                color: Colours.palette.m3outline

                elide: Text.ElideRight
                anchors.left: parent.left
                anchors.right: parent.right
            }
        }
    }
}
