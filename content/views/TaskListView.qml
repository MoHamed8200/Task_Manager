import QtQuick
import QtQuick.LocalStorage  as Sql
import DatabaseModule

TaskListViewForm {
    Database {
           id: dbManager
       }



    Component.onCompleted: {
           loadTasksFromDatabase()
       }
    function loadTasksFromDatabase() {
               var tasks = dbManager.getTasks()
        console.log(tasks)
               taskModel1.clear()
               for (var i = 0; i < tasks.length; i++) {
                   taskModel1.append({
                       taskId: tasks[i].taskId,
                       taskName: tasks[i].taskName,
                       deadline: tasks[i].deadline
                   })
               }
           }



    addbutton.onClicked: {

        let addTaskView = stackView.push(Qt.resolvedUrl("AddTaskView.qml"))



        addTaskView.taskAdded.connect((taskName, deadline) => {

                                          dbManager.insertTask(taskName, deadline);
                                                loadTasksFromDatabase();




            });
        }



    }


