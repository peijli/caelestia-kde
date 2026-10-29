import "../components"
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property bool firstInput
    required property string currentSession
    required property string currentUser
    required property int rectHeight

    property string os: config.os || "Linux"
    property string host: config.host || "localhost"
    property string session: root.currentSession || "-"

    RowLayout {
        Rectangle {
            width: 33
            height: 35
            radius: 13
            Layout.leftMargin: 23
            Layout.topMargin: 25
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            color: config.secondary

            Text {
                renderType: Text.NativeRendering
                anchors.centerIn: parent
                color: "#111111"
                text: ">"
                font.family: "CaskaydiaCove NF"
                font.pointSize: 15
            }
        }

        Text {
            renderType: Text.NativeRendering
            color: config.text
            text: "caelestiafetch.sh"
            font.family: "CaskaydiaCove NF"
            font.pointSize: 13
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.topMargin: 32
            Layout.leftMargin: 8
        }
    }

    ColumnLayout {
        Item {
            width: 30
            height: 30
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            Logo {
                skipIntroAnimation: root.firstInput
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.leftMargin: 25
                Layout.topMargin: 50
                Layout.preferredWidth: 130
                Layout.preferredHeight: 130
            }

            GridLayout {
                columns: 2
                columnSpacing: 10
                rowSpacing: 0
                Layout.leftMargin: 12
                Layout.topMargin: root.rectHeight / 10

                Repeater {
                    model: [
                        { label: "SESSION :", value: root.session },
                        { label: "USER    :", value: root.currentUser },
                        { label: "OS      :", value: root.os },
                        { label: "HOST    :", value: root.host }
                    ]

                    delegate: Text {
                        required property var modelData
                        required property int index

                        renderType: Text.NativeRendering
                        text: modelData.label
                        color: config.text
                        font.pixelSize: 18
                        font.family: "CaskaydiaCove NF"
                        Layout.row: index
                        Layout.column: 0
                        Layout.preferredHeight: 30
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                // Session and distro names can be long ("Plasma (Wayland)",
                // "Ubuntu 26.04.1 LTS"): shrink to fit the panel, then elide.
                Repeater {
                    model: [root.session, root.currentUser, root.os, root.host]

                    delegate: Text {
                        required property string modelData
                        required property int index

                        renderType: Text.NativeRendering
                        text: modelData
                        color: config.text
                        font.pixelSize: 18
                        font.family: "CaskaydiaCove NF"
                        fontSizeMode: Text.HorizontalFit
                        minimumPixelSize: 12
                        elide: Text.ElideRight
                        Layout.row: index
                        Layout.column: 1
                        Layout.preferredWidth: 110
                        Layout.preferredHeight: 30
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        RowLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter
            Layout.leftMargin: 30
            Layout.topMargin: 4

            Rectangle {
                width: 30
                height: 30
                color: config.background
                radius: 12
            }

            Rectangle {
                width: 30
                height: 30
                color: config.primary
                radius: 12
            }

            Rectangle {
                width: 30
                height: 30
                color: config.text
                radius: 12
            }

            Rectangle {
                width: 30
                height: 30
                color: config.textDark
                radius: 12
            }

            Rectangle {
                width: 30
                height: 30
                color: config.secondary
                radius: 12
            }

            Rectangle {
                width: 30
                height: 30
                color: config.onSuccess
                radius: 12
            }

            Rectangle {
                width: 30
                height: 30
                color: config.inverseOnSurface
                radius: 12
            }
        }
    }
}
