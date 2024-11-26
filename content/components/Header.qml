import QtQuick
import "./../views"
HeaderForm {

    dashboardbutton.onClicked:{
        navigateToDashboard()

    }
    // signal taskListClicked
    tasksbutton.onClicked: {

navigateToTasks()

    }


}
