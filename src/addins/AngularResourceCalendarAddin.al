controladdin AngularResourceCalendarAddin
{
    // VerticalShrink = true;
    // HorizontalShrink = true;
    // MinimumHeight = 1900;
    // MinimumWidth = 800;
    // RequestedHeight = 1900;
    // RequestedWidth = 800;
    // VerticalStretch = true;
    // HorizontalStretch = true;
    // MaximumWidth = 800;
    // MaximumHeight = 1900;

    VerticalShrink = true;
    HorizontalShrink = true;
    VerticalStretch = true;
    HorizontalStretch = true;

    RequestedWidth = 800;
    RequestedHeight = 600;

    StartupScript = 'src/Scripts/startup.js';
    Scripts = 'https://h2909571.stratoserver.net/HellebrekerPackages/1.ResourceCalendarExternalPackages/js/angwrapper.js';
    //Load stylesheet
    StyleSheets = 'https://h2909571.stratoserver.net/HellebrekerPackages/1.ResourceCalendarExternalPackages/style/styles.css',
                    'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css';

    //Load scripts as images so they are loaded before the control is loaded
    //Event that is fired when the control is ready from js side
    event ControlReady();

    /// <summary>
    /// Add an employee to the calendar
    /// </summary>
    /// <param name="name">Name of the employee </param>
    /// <param name="employeeID">ID of the employee </param>
    procedure AddEmployee(name: Text; employeeID: Text);

    /// <summary>
    /// Add an event to the calendar
    /// </summary>
    /// <param name="startDateTime">Start date and time of the event</param>
    /// <param name="endDateTime">End date and time of the event</param>
    /// <param name="id">ID of the event</param>
    /// <param name="itemText">Text of the event</param>
    /// <param name="employeeID">ID of the employee</param>
    /// <param name="backColor">Background color of the event</param>
    /// <param name="cssClass">CSS class of the event</param>
    procedure AddEvent(startDateTime: DateTime; endDateTime: DateTime; id: Text; itemText: Text; employeeID: Text; backColor: Text);

    /// <summary>
    /// Add an event to the calendar
    /// </summary>
    /// <param name="startDateTime">Start date and time of the event</param>
    /// <param name="endDateTime">End date and time of the event</param>
    /// <param name="id">ID of the event</param>
    /// <param name="itemText">Text of the event</param>
    /// <param name="employeeID">ID of the employee</param>
    /// <param name="backColor">Background color of the event</param>
    /// <param name="cssClass">CSS class of the event</param>
    /// <param name="html">HTML of the event</param>

    procedure AddEvent(startDateTime: DateTime; endDateTime: DateTime; id: Text; itemText: Text; employeeID: Text; backColor: Text; cssClass: Text; html: Text);
}
