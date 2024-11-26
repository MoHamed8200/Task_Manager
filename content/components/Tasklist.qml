import QtQuick
import QtQuick.Controls
import QtQuick.LocalStorage  as Sql
import DatabaseModule 1.0 // Import the `database` class

Item {
  Database {
        id: databaseInstance
    }
    property ListModel taskModel: ListModel {}
    // function removeTaskByIndex(index) {
    //       if (index >= 0 && index < taskModel.count) {
    //           var taskToRemove = taskModel.get(index).taskName;

    //           taskModel.remove(index);

    //           var db = Sql.LocalStorage.openDatabaseSync("StickyNotesDB", "1.0", "The Sticky Notes Database", 1000000);

    //           db.transaction(function(tx) {
    //               tx.executeSql('DELETE FROM Tasks WHERE name = ?', [taskToRemove]);
    //           });

    //           console.log("Task removed from database and model: " + taskToRemove);
    //       }
    //   }
function removeTaskByIndex(index) {
        if (index >= 0 && index < taskModel.count) {
            const taskId = taskModel.get(index).taskId;

            // Remove from the database
            if (databaseInstance.deleteTask(taskId)) {
                taskModel.remove(index);
                console.log("Task removed from database and model: " + taskId);
            } else {
                console.log("Failed to remove task with ID: " + taskId);
            }
        }
    }


            ListView {
                width: parent.width
                height: parent.height-addbutton.height-20
                model: taskModel
                delegate: Item {
                    property variant myData: model

                    width: parent.width
                    height: 50



                    Rectangle {
                        width: parent.width
                        height: 60
                        color: "#FFFFFF"
                        border.color: "#E0E0E0"
                        radius: 8
                        // shadow: Item { anchors.fill: parent; radius: 10; color: "#000000"; opacity: 0.1 }

                        Row {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 15

                            // Task details with better alignment and styling
                            Column {
                                spacing: 4
                                Text {
                                    text: model.taskName
                                    font.pixelSize: 16
                                    color: "#333333"
                                    width: parent.width * 0.6 // Control width for task name wrapping
                                    elide: Text.ElideRight // Elides text if too long
                                }
                                Text {
                                    text: model.deadline
                                    font.pixelSize: 14
                                    color: "#888888"
                                }
                            }

                            // Delete button with improved styling
                            Button {
                                id: deleteTask
                                text: "Delete"
                                width: 80
                                height: 32
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                onClicked: removeTaskByIndex(index)

                                // Styling the button
                                background: Rectangle {
                                    color: "#FF6347" // Tomato color for the delete button
                                    radius: 16
                                    border.color: "#D9534F"
                                }
                                // color: "white"
                                font.bold: true
                                font.pixelSize: 14

                            }
                        }
                    }

                }
            }


}
