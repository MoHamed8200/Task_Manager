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

       // function loadTasksFromDatabase() {
       //     var db = Sql.LocalStorage.openDatabaseSync(
       //         "StickyNotesDB",
       //         "1.0",
       //         "The Sticky Notes Database",
       //         1000000
       //     );

       //     db.transaction(function (tx) {
       //         // Create the Tasks table if it doesn't exist
       //         // tx.executeSql(
       //         //           "Drop TABLE Tasks"

       //         // );
       //         tx.executeSql(
       //             "CREATE TABLE IF NOT EXISTS Tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, deadline TEXT)"
       //         );

       //         // Query all tasks from the database
       //         var rs = tx.executeSql("SELECT * FROM Tasks");

       //         // Clear the current taskModel before loading new data
       //         taskModel1.clear();

       //         // Populate the taskModel with tasks from the database
       //         for (var i = 0; i < rs.rows.length; i++) {
       //             taskModel1.append({
       //                 taskId: rs.rows.item(i).id,
       //                 taskName: rs.rows.item(i).name,
       //                 deadline: rs.rows.item(i).deadline,
       //             });
       //         }
       //     });
       // }

    addbutton.onClicked: {

        let addTaskView = stackView.push(Qt.resolvedUrl("AddTaskView.qml"))



        addTaskView.taskAdded.connect((taskName, deadline) => {

                                          dbManager.insertTask(taskName, deadline);
                                                loadTasksFromDatabase();
          //   console.log("Task added:", taskName, "Deadline:", deadline);

          //   // Add the task to the model

          //   // Open or create the database
          //   var db = Sql.LocalStorage.openDatabaseSync(
          //       "StickyNotesDB",
          //       "1.0",
          //       "The StickyNotes Database",
          //       1000000
          //   );

          //   db.transaction(function (tx) {
          //       // Create the database table if it doesn't exist
          //       // tx.executeSql(
          //       //           "Drop TABLE Tasks"

          //       // );
          //       tx.executeSql(

          // "CREATE TABLE IF NOT EXISTS Tasks(    id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, deadline TEXT)"
          //       );

          //       // Insert the task name and deadline into the database
          //       tx.executeSql("INSERT INTO Tasks(name, deadline) VALUES(?, ?)", [taskName, deadline]);

          //       taskModel1.append({ taskName: taskName, deadline: deadline });
          //       // Retrieve and log all tasks from the database
          //       var rs = tx.executeSql("SELECT * FROM Tasks");
          //       taskModel1.clear();

          //       // Populate the taskModel with tasks from the database
          //       for (var i = 0; i < rs.rows.length; i++) {
          //           taskModel1.append({
          //               taskId: rs.rows.item(i).id,
          //               taskName: rs.rows.item(i).name,
          //               deadline: rs.rows.item(i).deadline,
          //           });
          //       }

            });
        }



    }


