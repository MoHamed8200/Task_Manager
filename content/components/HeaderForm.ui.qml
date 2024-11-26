
import QtQuick
import QtQuick.Controls


Rectangle {
    id: header
    // width: parent.width
    height: 60
    color: "#109415" // Primary color for the header
    radius: 4

    border.color: "#388E3C"
    border.width: 1
    property alias dashboardbutton: dashboardbutton
    property alias statisticsbutton: statisticsbutton
    property alias tasksbutton: tasksbutton



    // Signals for navigation
    signal navigateToDashboard()
    signal navigateToTasks()
    signal navigateToStatistics()
    signal navigateToSettings()
    signal logout()

    Row {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 20
        height: 50

        // App Title
        Text {
            id: appTitle
            text: title
            color: "white"
            font.pixelSize: 20
            font.bold: true
        }

        // Navigation Buttons
        Button {
            id:dashboardbutton
            text: "Dashboard"
            icon.source: "qrc:/images/dashboard.png"
            background: Rectangle {
                color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                radius: 6
            }
        }

        Button {
            id: tasksbutton
            text: "Tasks"
            icon.source: "qrc:/images/tasks.png"
            background: Rectangle {
                color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                radius: 6
            }
        }

        Button {
            id: statisticsbutton
            text: "Statistics"
            icon.source: "qrc:/images/statistics.png"
            background: Rectangle {
                color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                radius: 6
            }
        }

        Button {
            text: "Settings"
            icon.source: "qrc:/images/settings.png"
            background: Rectangle {
                color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                radius: 6
            }

        }

        // Spacer to push user actions to the right
        Rectangle {
            width: 1
            color: "transparent"
        }

        // User Actions (Logout)
        Button {
            text: "Logout"
            background: Rectangle {
                color: parent.down ? "#bbbbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                radius: 6
            }
        }
    }
    // signal taskListClicked

    // Customizable title property
    property alias title: appTitle.text
}



















// // Item {
// //     width: 1024
// //     height: 768

// //     property alias button: button

// //     Button {
// //         id: button
// //         x: 64
// //         y: 64
// //         text: qsTr("Button")
// //     }
// // }
// import QtQuick
// import QtQuick.Controls

// Rectangle {
//     id: header
//     // width: parent.width
//     height: 60
//     color: "#109415" // Primary color for the header
//     radius: 4

//     // Styling
//     border.color: "#388E3C" // Slightly darker border color
//     border.width: 1

//     Row {
//         anchors.fill: parent
//         anchors.margins: 10
//         anchors.leftMargin: -10
//         spacing: 20

//         // App Title
//         Text {
//             id: appTitle
//             text: title
//             color: "white"
//             font.pixelSize: 20
//             font.bold: true
//             // Layout.alignment: Qt.AlignLeft
//         }

//         // Navigation Buttons
//         Button {
//             text: "Dashboard"
//             icon.color: "#2a2626"

//             // background: Rectangle {
//             //     // visible: false
//             //     anchors.fill: parent // Ensures it aligns with the button

//             // }
//             background: Rectangle {
//                 // color: "#1b1b1b"
//                 // color: header.color.darker(120)
//                 radius: 6


//                     color: parent.down ? "#bbbbbb" :
//                             (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//             }
//             // onClicked: header.onDashboardClicked()
//         }

//         Button {
//             text: "Tasks"
//             background: Rectangle {
//                 color: parent.down ? "#bbbbbb" :
//                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                 radius: 6
//             }
//             // onClicked: header.onTaskListClicked()
//         }

//         Button {
//             text: "Statistics"
//             background: Rectangle {
//                 color: parent.down ? "#bbbbbb" :
//                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                 radius: 6
//             }
//             // onClicked: header.onStatisticsClicked()
//         }

//         Button {
//             text: "Settings"
//             background: Rectangle {
//                 color: parent.down ? "#bbbbbb" :
//                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                 radius: 6
//             }
//             // onClicked: header.onSettingsClicked()
//         }

//         // Spacer to push user actions to the right
//         Rectangle {
//             // Layout.fillWidth: true
//             color: "transparent"
//         }

//         // User Actions (e.g., logout or profile)
//         Button {
//             text: "Logout"
//             background: Rectangle {
//                 color: parent.down ? "#bbbbbb" :
//                         (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                 radius: 6
//             }
//             // onClicked: header.onLogoutClicked()
//         }
//     }

//     // Customizable title property
//     property alias title: appTitle.text

//     // Signals for navigation
//     signal onDashboardClicked
//     signal onTaskListClicked
//     signal onStatisticsClicked
//     signal onSettingsClicked
//     signal onLogoutClicked
// }


// import QtQuick
// import QtQuick.Controls

// Item {
//     visible: true
//     width: 1024
//     height: 768

//     Rectangle {
//         // Header placed at the top
//         id: header
//         width: parent.width
//         height: 60
//         color: "#109415" // Primary color for the header
//         radius: 4

//         // Styling
//         border.color: "#388E3C" // Slightly darker border color
//         border.width: 1

//         Row {
//             anchors.fill: parent
//             anchors.margins: 10
//             spacing: 20

//             // App Title
//             Text {
//                 id: appTitle
//                 text: title
//                 color: "white"
//                 font.pixelSize: 20
//                 font.bold: true
//             }

//             // Navigation Buttons
//             Button {
//                 text: "Dashboard"
//                 background: Rectangle {
//                     color: parent.down ? "#bbbbbb" :
//                             (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                     radius: 6
//                 }
//                 // onClicked: header.onDashboardClicked()
//             }

//             Button {
//                 text: "Tasks"
//                 background: Rectangle {
//                     color: parent.down ? "#bbbbbb" :
//                             (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                     radius: 6
//                 }
//                 // onClicked: header.onTaskListClicked()
//             }

//             Button {
//                 text: "Statistics"
//                 background: Rectangle {
//                     color: parent.down ? "#bbbbbb" :
//                             (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                     radius: 6
//                 }
//                 // onClicked: header.onStatisticsClicked()
//             }

//             Button {
//                 text: "Settings"
//                 background: Rectangle {
//                     color: parent.down ? "#bbbbbb" :
//                             (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                     radius: 6
//                 }
//                 // onClicked: header.onSettingsClicked()
//             }

//             // Spacer to push user actions to the right
//             Rectangle {
//                 width: 1 // Small spacer with width 1 to push buttons to the right
//                 color: "transparent"
//             }

//             // User Actions (e.g., logout or profile)
//             Button {
//                 text: "Logout"
//                 background: Rectangle {
//                     color: parent.down ? "#bbbbbb" :
//                             (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                     radius: 6
//                 }
//                 // onClicked: header.onLogoutClicked()
//             }
//         }

//         // Customizable title property
//         property alias title: appTitle.text

//         // Signals for navigation
//         signal onDashboardClicked
//         signal onTaskListClicked
//         signal onStatisticsClicked
//         signal onSettingsClicked
//         signal onLogoutClicked
//     }

//     // Main Content Below the Header
//     Rectangle {
//         id: contentArea
//         width: parent.width
//         height: parent.height - header.height  // Content area takes the remaining space
//         anchors.top: header.bottom // Anchors below the header
//         color: "#f0f0f0" // Background color for content area

//         Text {
//             text: "Content goes here!"
//             anchors.centerIn: parent
//             font.pixelSize: 24
//             color: "#333"
//         }
//     }
// }
