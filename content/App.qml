
import QtQuick
import QtQuick.Controls
import "views"
import "components"
//import content

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1024
    height: 768
//    Back2{

//    }

    // Header
    Header {
        id: header
        anchors.top: parent.top

        // Connect signals to navigation actions
        onNavigateToDashboard: stackView.replace(Qt.resolvedUrl("views/DashboardView.qml"))
        onNavigateToTasks: stackView.replace(Qt.resolvedUrl("views/TaskListView.qml"))
        onNavigateToStatistics: stackView.replace(Qt.resolvedUrl("views/StatisticsView.qml"))
        onNavigateToSettings: stackView.replace(Qt.resolvedUrl("views/SettingsView.qml"))
        onLogout: {
            stackView.clear()
            stackView.push(Qt.resolvedUrl("views/LoginView.qml"))
        }
    }

    // StackView for pages, positioned below the fixed header
    StackView {
        id: stackView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        initialItem: Qt.resolvedUrl("views/DashboardView.qml")
    }
}






















//// Copyright (C) 2021 The Qt Company Ltd.
//// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

//import QtQuick
////import TaskManager
//import QtQuick.Controls
//import "views"
//import "components"
//// import TaskBase

////import content
//Window {
//    width: mainScreen.width
//    height: mainScreen.height

//    visible: true
//    title: "TaskManager"
////   Back2{
////       id:back2
////   }

//    // TaskBase {
//    //      id: taskBase
//    //  }
//    Screen01 {
//        id: mainScreen
//    }


//    StackView {
//           id: stackView
//           anchors.fill: parent

//           initialItem: DashboardView {
//               id: dashboardView
//               onTaskListClicked:{

//                   stackView.push(Qt.resolvedUrl("views/TaskListView.qml"));


//               }

//           }


//       }

//}


