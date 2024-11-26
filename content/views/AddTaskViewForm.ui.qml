

import QtQuick
import QtQuick.Controls
import "./../components"
import QtQuick.Layouts
Item {
    id: addTaskView


    property alias button: button
    property alias taskNameField: taskNameField
    property alias dueDatePicker: dueDatePicker

    Column {
        // anchors.centerIn: parent
        spacing: 20
        padding: 20
        Row{



        // Task Name Section
        Column {
            spacing: 5
            // width: parent.width * 0.8

            Label {
                text: "Task Name"
                font.pixelSize: 16
                color: "#333"
                horizontalAlignment: Text.AlignLeft
            }

            TextField {
                id: taskNameField
                placeholderText: "Enter task name"
                font.pixelSize: 16
                // height: 40
                Layout.fillWidth: true
            }
        }

        // Deadline Section
        Column {
            spacing: 5
            // width: parent.width * 0.8

            Label {
                text: "Deadline"
                font.pixelSize: 16
                color: "#333"
                horizontalAlignment: Text.AlignLeft
            }

            KSDatePicker {
                id: dueDatePicker
                selected_date: new Date()
                height: 40
                width: parent.width * 0.8
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }

        }


        Button {
            id: button
            text: "Save Task"
            font.pixelSize: 16
            width: parent.width * 0.5
            height: 40

        }
        // }
    }

    // Background Rectangle
    Rectangle {
        color: "#F9F9F9"
        anchors.fill: parent
        z: -1
        radius: 10
    }
}

