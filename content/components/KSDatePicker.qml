import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.qmlmodels

Item {
    property date selected_date: new Date()
    property string format: 'dddd, d MMMM yyyy'
    property date _temp_date: selected_date
    property bool month_is_str: format.indexOf("MMMM") != -1
    property  string selected_color: "lightblue"
    function days_in_a_month(y, m) {
        return new Date(y, m + 1, 0).getDate();
    }

    function week_start(y, m) {
        return new Date(y, m, 1).getDay();
    }

    function sync_calendar(day) {
        const month = day.getMonth();
        const year = day.getFullYear();
        const total_days = days_in_a_month(year, month);
        const first_day = week_start(year, month);

        model.clear();

        // Days from the previous month
        if (first_day > 0) {
            const prev_month = new Date(year, month - 1);
            const prev_month_days = days_in_a_month(prev_month.getFullYear(), prev_month.getMonth());

            for (let i = prev_month_days - first_day + 1; i <= prev_month_days; i++) {
                model.append({
                    day: i,
                    inMonth: false
                });
            }
        }

        // Days in the current month
        for (let i = 1; i <= total_days; i++) {
            model.append({
                day: i,
                inMonth: true
            });
        }

        const remaining_days = (42 - model.count);
        for (let i = 1; i <= remaining_days; i++) {
            model.append({
                day: i,
                inMonth: false
            });
        }
    }



    Column {
        focus: true
        spacing: 10
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape) {
                date_picker_trigger.checked = false;
            }
        }

        Row {
           
         
            TextField {
                id: date_field
                text: selected_date.toLocaleDateString(Qt.locale(), format)
                width: 300
                height: 35
                readOnly: true
                // color: selected_color
                background: Rectangle {
                    border.color: "black"
                    color: selected_color
                }
                TapHandler {
                    onTapped: {
                        date_picker_trigger.checked = !date_picker_trigger.checked;
                    }
                }
            }

            Button {
                                height: 35

                id: date_picker_trigger
                // text: checked ? '▲' : '▼'
                text :"🗓️"
                checkable: true
                onCheckedChanged: {
                    if (checked) {
                        sync_calendar(selected_date);
                    }
                }
            }
        }

        ColumnLayout {
            visible: date_picker_trigger.checked
            width: 245
            height: 245
            anchors.right: parent.right
            anchors.rightMargin: date_picker_trigger.width

            
            RowLayout {
                Layout.fillWidth: true
                spacing: 20
                // Dropdown for selecting the month
                ComboBox {
                    id: monthDropdown
                    Layout.fillWidth: true
                   
                    model: month_is_str ? ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
                    currentIndex: _temp_date.getMonth() // Set to the current month
                    onCurrentIndexChanged: {
                        const _date = _temp_date;
                        _date.setMonth(currentIndex); // Update the temporary date
                        sync_calendar(_date);        // Synchronize the calendar
                        _temp_date = _date;
                        selected_date = _temp_date;
                    }
                    
                    
                    
                }

                // Dropdown for selecting the year
                ComboBox {
                    id: yearDropdown
                    Layout.fillWidth: true
                    model: ListModel {
                        Component.onCompleted: {
                            for (let year = 1900; year <= 2100; year++) {
                                append({
                                    text: year.toString()
                                });
                            }
                        }
                    }

                    textRole: "text"
                    currentIndex: _temp_date.getFullYear() - 1900 // Set to the current year
                    onCurrentIndexChanged: {
                        const _date = _temp_date;
                        _date.setFullYear(1900 + currentIndex); // Update the year
                        sync_calendar(_date);                  // Synchronize the calendar
                        _temp_date = _date;
                        selected_date = _temp_date;
                    }
                }
            }

            Grid {
                Layout.fillWidth: true
                Layout.fillHeight: true
                columns: 7
                rows: 7

                Repeater {
                    model: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                    delegate: Label {
                        width: 35
                        height: 35
                        horizontalAlignment: Text.AlignHCenter
                        text: modelData
                    }
                }

                Repeater {
                    model: ListModel {
                        id: model
                    }

                    delegate: DelegateChooser {
                        DelegateChoice {
                            roleValue: 0

                            delegate: Item {
                                width: 35
                                height: 35
                            }
                        }

                        DelegateChoice {
                            delegate: Button {
                                width: 35
                                height: 35
                                text: day
                                highlighted: day === _temp_date.getDate() && selected_date.getMonth() === _temp_date.getMonth() && selected_date.getFullYear() === _temp_date.getFullYear()
                                onClicked: {
                                    const _date = _temp_date;
                                    _date.setDate(day);
                                    _temp_date = _date;
                                    selected_date = _temp_date;
                                    // date_picker_trigger.checked = false;
                                }
                                background: Rectangle {
                                    border.color: "black"
                                    border.width: 0
                                    radius: width / 2 // Make the rectangle circular
                                    color: inMonth ? (highlighted ? selected_color : "white") : "lightgray"
                                }
                                opacity: inMonth ? 1 : 0.15


                            }
                        }
                    }
                }
            }
        }
    }
}
