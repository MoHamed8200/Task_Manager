import QtQuick

AddTaskViewForm {

    signal taskAdded(string taskName,string deadline)

    button.onClicked: {
        if (taskNameField.text.trim().length > 0) {
            taskAdded(taskNameField.text,dueDatePicker.selected_date)

            stackView.pop() // Return to the previous view after adding the task
        } else {
            console.log("Task name is required!")
        }
    }
}
