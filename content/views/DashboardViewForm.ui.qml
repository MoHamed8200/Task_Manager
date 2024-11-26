
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./../components"
Item {
    visible: true
    width: 1024
    height: 768

    // Header at the top


    // // Main Content Below the Header
    Rectangle {
        id: contentArea
        width: parent.width
        height: parent.height - header.height
        anchors.top: header.bottom
        color: "#f0f0f0" // Background color for content area
        // padding: 20

        // Grid layout for dashboard items
        GridLayout {
            columns: 3
            anchors.fill: parent
            anchors.margins: 20
            // spacing: 20

            // Dashboard Card 1
            Rectangle {
                width: parent.width / 3 - 30
                height: 150
                color: "#4CAF50"
                radius: 8

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        text: "Tasks Overview"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Button {
                        text: "View Tasks"
                        background: Rectangle {
                            color: "#388E3C"
                            radius: 6
                        }
                    }
                }
            }

            // Dashboard Card 2
            Rectangle {
                width: parent.width / 3 - 30
                height: 150
                color: "#2196F3"
                radius: 8

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        text: "Statistics"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Button {
                        text: "View Stats"
                        background: Rectangle {
                            color: "#1976D2"
                            radius: 6
                        }
                    }
                }
            }

            // Dashboard Card 3
            Rectangle {
                width: parent.width / 3 - 30
                height: 150
                color: "#FF5722"
                radius: 8

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        text: "Settings"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Button {
                        text: "Go to Settings"
                        background: Rectangle {
                            color: "#E64A19"
                            radius: 6
                        }
                    }
                }
            }

            // Additional cards or content can be added here...
        }
    }
}





