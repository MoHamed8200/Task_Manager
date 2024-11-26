import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage as Sql
import "./../components"

Item {
    id: taskListView

    property ListModel taskModel1: ListModel {
        // ListElement { taskName: "Buy groceries" }
        // ListElement { taskName: "Finish project report" }
        // ListElement { taskName: "Call John" }
        // ListElement { taskName: "Clean the house" }
    }

    property alias addbutton: addbutton


    Column {
        anchors.fill: parent
        spacing: 15



        Tasklist{
             id:taskList
             width: parent.width
             height: parent.height - addbutton.height - 20

             taskModel:taskModel1
        }


        Button {
            id: addbutton
            text: "Add New Task"
            width: parent.width * 0.9 // Make it visually appealing
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}


































//import QtQuick
//import QtQuick.Controls
//import "./../components"

//Item {
//    id: taskListView

//    property ListModel taskModel: ListModel {
//        ListElement { taskName: "Task 1" }
//        ListElement { taskName: "Task 2" }
//        ListElement { taskName: "Task 3" }
//    }
////    property alias addbutton: addbutton
////    signal taskDeleted(string taskName)


//    Column {
//        anchors.fill: parent
//        spacing: 15


//        // Task List Section
//        ListView {
//            id: taskList
//            width: parent.width
//            height: parent.height - button.height - 45
//            model: taskModel
//            delegate: Item {
//                width: parent.width
//                height: 50

//                Rectangle {
//                    width: parent.width
//                    height: 50
//                    color: "#FFFFFF"
//                    border.color: "#E0E0E0"
//                    radius: 8

//                    Row {
//                        anchors.fill: parent




//                        Text {

//                                text: model.taskName;
//                                font.pixelSize: 16
//                                color: "black"

//                            }

//                            Button {
//                                id:deletetask
//                                text: "Delete"

//                                anchors.right: parent.right
////                                onClicked:taskDeleted(model.taskName)
//                            }

//                    }
//                }
//            }
//        }

//        Button {
////            id: addbutton
////            text: "Add New Task"
////            width: parent.width * 0.9
////            anchors.horizontalCenter: parent.horizontalCenter
//        }
//    }
//}


    // Connect the signal to the task removal function
//    taskDeleted.connect(function(taskName) {
//        console.log("Deleting task:", taskName);
//        // Remove from ListModel
//        taskModel.remove(taskModel.indexOf({taskName: taskName}));

//        // Also remove from the database
//        var db = Sql.LocalStorage.openDatabaseSync("StickyNotesDB", "1.0", "The sticky notes Database", 1000000);
//        db.transaction(function(tx) {
//            // Delete the task from the database
//            tx.executeSql('DELETE FROM Tasks WHERE name = ?', [taskName]);
//        });
//    })






//import QtQuick
//import QtQuick.Controls
//import QtQuick.Layouts
//import QtQuick.LocalStorage as Sql

//Item {
//    id: taskListView

//    property ListModel taskModel: ListModel {}

//    property alias button: button

//    ColumnLayout {
//        anchors.fill: parent
//        spacing: 15

//        // Task List Section
//        Repeater {
//            model: taskModel
//            delegate: Item {
//                width: parent.width
//                height: 50

//                // RowLayout used to arrange the task components horizontally
//                RowLayout {
//                    Layout.fillWidth: true
//                    spacing: 20  // Set the spacing between the items in the RowLayout
////                    anchors.horizontalCenter: parent.horizontalCenter

//                    // Task name text on the left
//                    Text {
//                        text: model.taskName
//                        font.pixelSize: 16
//                        width: parent.width-10
//                        height: parent.height-10
////                        Layout.fillWidth: true  // Text will take available width
//                    }

//                    // Delete Button with fixed width at the end
//                    Button {
//                        text: "Delete"
//                        width: 80  // Fixed width for the button
//                        height: 30
////                        color: "#FF6666"
////                        border.color: "#FF3333"
////                        radius: 5
////                        Layout.alignment: Qt.AlignRight  // Align button to the right of the RowLayout
////                        y:parent.width-10
////                        x:parent.width-10

////                        onPressed: {
////                            parent.color = "#FF3333"
////                        }

////                        onReleased: {
////                            parent.color = "#FF6666"
////                        }

////                        MouseArea {
////                            anchors.fill: parent
////                            onClicked: {
////                                taskModel.remove(index)  // Removes task from the model
////                                deleteTaskFromDatabase(model.taskName)
////                            }
////                        }
//                    }
//                }
//            }
//        }

//        // Footer Section (Add New Task Button)
//        Button {
//            id: button
//            text: "Add New Task"
//            width: parent.width * 0.9 // Make it visually appealing
//            anchors.horizontalCenter: parent.horizontalCenter
////            onClicked: {
////                let addTaskView = stackView.push(Qt.resolvedUrl("AddTaskView.qml"))
////                addTaskView.taskAdded.connect((taskName) => {
////                    taskModel.append({ taskName: taskName })
////                    addTaskToDatabase(taskName)
////                })
////            }
//        }
//    }

//    // Function to add task to the database
////    function addTaskToDatabase(taskName) {
////        var db = Sql.LocalStorage.openDatabaseSync("StickyNotesDB", "1.0", "The sticky notes Database", 1000000)
////        db.transaction(function(tx) {
////            tx.executeSql('CREATE TABLE IF NOT EXISTS Tasks(name TEXT)')
////            tx.executeSql('INSERT INTO Tasks VALUES(?)', [taskName])
////        })
////    }

////    // Function to delete task from the database
////    function deleteTaskFromDatabase(taskName) {
////        var db = Sql.LocalStorage.openDatabaseSync("StickyNotesDB", "1.0", "The sticky notes Database", 1000000)
////        db.transaction(function(tx) {
////            tx.executeSql('DELETE FROM Tasks WHERE name = ?', [taskName])
////        })
////    }
//}




// // /*
// // This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
// // It is supposed to be strictly declarative and only uses a subset of QML. If you edit
// // this file manually, you might introduce QML code that is not supported by Qt Design Studio.
// // Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
// // */

// // import QtQuick
// // import QtQuick.Controls

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


// Item {
//     id: taskListView

//     property ListModel taskModel: ListModel {
//         // Initialize the model with tasks if needed
//         ListElement { taskName: "Task 1" }
//         ListElement { taskName: "Task 2" }
//         ListElement { taskName: "Task 3" }
//     }

//     property alias button: button

//     Column {
//         anchors.fill: parent
//         spacing: 15
//         Header {
//                   // title: "Task List"
//                   // onDashboardClicked: {
//                   //     stackView.pop()  // Go back to the dashboard view
//                   // }
//               }
//         // Task List Section
//         ListV

// Item {
//     id: taskListView

//     property ListModel taskModel: ListModel {
//         // Initialize the model with tasks if needed
//         ListElement { taskName: "Task 1" }
//         ListElement { taskName: "Task 2" }
//         ListElement { taskName: "Task 3" }
//     }

//     property alias button: button

//     Column {
//         anchors.fill: parent
//         spacing: 15
//         Header {
//                   // title: "Task List"
//                   // onDashboardClicked: {
//                   //     stackView.pop()  // Go back to the dashboard view
//                   // }
//               }
//         // Task List Section
//         ListView {
//             id: taskList
//             width: parent.width
//             height: parent.height - button.height - 30 // Ensure space for the button
//             model: taskModel
//             delegate: Item {
//                 width: parent.width
//                 height: 50

//                 Rectangle {
//                     width: parent.width
//                     height: 50
//                     color: "#FFFFFF"
//                     border.color: "#E0E0E0"
//                     radius: 8

//                     Row {
//                         anchors.fill: parent
//                         spacing: 20

//                         Text { text: model.taskName; font.pixelSize: 16 }
//                         Text { text: model.dueDate; color: "#777777"; font.pixelSize: 14 }
//                     }
//                 }
//             }
//         }

//         // Footer Section (Button)
//         Button {
//             id: button
//             text: "Add New Task"
//             width: parent.width * 0.9 // Make it visually appealing
//             anchors.horizontalCenter: parent.horizontalCenter
//         }
//     }
// }iew {
//             id: taskList
//             width: parent.width
//             height: parent.height - button.height - 30 // Ensure space for the button
//             model: taskModel
//             delegate: Item {
//                 width: parent.width
//                 height: 50

//                 Rectangle {
//                     width: parent.width
//                     height: 50
//                     color: "#FFFFFF"
//                     border.color: "#E0E0E0"
//                     radius: 8

//                     Row {
//                         anchors.fill: parent
//                         spacing: 20

//                         Text { text: model.taskName; font.pixelSize: 16 }
//                         Text { text: model.dueDate; color: "#777777"; font.pixelSize: 14 }
//                     }
//                 }
//             }
//         }

//         // Footer Section (Button)
//         Button {
//             id: button
//             text: "Add New Task"
//             width: parent.width * 0.9 // Make it visually appealing
//             anchors.horizontalCenter: parent.horizontalCenter
//         }
//     }
// }
