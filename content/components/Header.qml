import QtQuick
import "./../views"
HeaderForm {

    dashboardbutton.onClicked:{
        navigateToDashboard()

    }
    // signal taskListClicked
    tasksbutton.onClicked: {
//        console.log("tasksbutton Pressed")
//        taskListClicked()
navigateToTasks()

    }


}
