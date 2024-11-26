/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
//import TaskManager
import "components"
import "views"
Rectangle {
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    // Text {
    //     text: qsTr("Hello TaskManager")
    //     anchors.centerIn: parent
    //     font.family: Constants.font.family
    // }

    // Column{
    //     spacing: 200


        // Header{
        //     width: parent.width // Ensure it stretches correctly
        //     height: 100         // Set a fixed or dynamic height
        //     // color: "lightblue"   // Optional: just for visualization


        // }

        // DashboardView{
            // width: parent.width
            // height: parent.height - Header.height - spacing // Adjust height dynamically
            // color: "lightgreen" // Optional: just for visualization
            // y:300
        // }


        // TaskListView{
        // }
    // }

    // StackView {
    //        id: stackView
    //        anchors.fill: parent

    //        initialItem: DashboardView {
    //            id: dashboardView
    //            onTaskListClicked: {
    //                // stackView.push(TaskListView{{)

    //            }
    //        //     onStatisticsClicked: {
    //        //         // stackView.push(StatisticsView {})
    //        //     }
    //        //     onSettingsClicked: {
    //        //         // stackView.push(SettingsView {})
    //        //     }
    //        }
    //    }

}
