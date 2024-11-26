
// import QtQuick
// import QtQuick.Controls
// import "./../components"
// Item {
//     id: addTaskView
//     // width: parent.width
//     // height: parent.height
//     // color: "#F0F0F0"

//     property alias button: button
//     property alias taskNameField: taskNameField

//     Column {
//         anchors.fill: parent
//         spacing: 15

//         Row{
//         height: 30

//         TextField {
//             id: taskNameField
//             placeholderText: "Enter task name"
//             // width: parent.width /2
//             anchors.left: parent.left
//             // Layout.margins: 20
//         }

//         KSDatePicker {
//             id: dueDatePicker
//             // width: parent.width /2
//             selected_date: new Date()
//             anchors.right: parent.right
//             // Layout.margins: 20
//         }
//         }
//         Row{


//         // Save Button
//         Button {
//             id: button
//             text: "Save Task"
//             // Layout.margins: 20
//             // onClicked: {
//             //     if (taskNameField.text.trim().length > 0) {
//             //         taskAdded(taskNameField.text, dueDatePicker.currentDate.toLocaleDateString())
//             //         stackView.pop() // Return to the previous view after adding the task
//             //     } else {
//             //         console.log("Task name is required!")
//             //     }
//             // }
//         }
//         }
//     }
// }

import QtQuick
import QtQuick.Controls
import "./../components"
import QtQuick.Layouts
Item {
    id: addTaskView
    // width: parent.width
    // height: parent.height

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

