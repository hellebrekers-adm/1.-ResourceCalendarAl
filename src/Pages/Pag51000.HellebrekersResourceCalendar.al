page 51000 HellebrekersResourceCalendar
{
    ApplicationArea = All;
    Caption = 'HellebrekersResourceCalendar';
    PageType = Document;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                usercontrol(AgenadAddin; AngularResourceCalendarAddin)
                {
                    ApplicationArea = All;

                    trigger ControlReady()
                    var
                        _currDateTime: DateTime;
                    begin
                        AddAllEmployees();
                    end;
                }
            }
        }
    }


    /// <summary>
    /// Adds all employees to the calendar
    /// </summary>
    internal procedure AddAllEmployees()
    var
        _employee: Record Employee;
    begin
        if (_employee.FindSet) then begin
            repeat
                CurrPage.AgenadAddin.AddEmployee(_employee."First Name" + ' - ' + _employee."No.", _employee."No.");
            until (_employee.Next = 0);
        end;
        AddAllEvents();
    end;


    /// <summary>
    /// Adds all events to the calendar
    /// </summary>
    internal procedure AddAllEvents()
    var
        _truckerRecord: Record Truckplanning;
        _employeeRecord: Record Employee;
        _orderRecord: Record "Sales Header";
        _startDate: DateTime;
        _title: Text;
    begin
        // Message(GetRandomColor());
        if _truckerRecord.FindSet() then begin
            repeat
                if (_truckerRecord.Order <> '') then begin
                    if _employeeRecord.Get(_truckerRecord.Employee) then begin
                        if _orderRecord.Get("Sales Document Type"::Order, _truckerRecord.Order) then begin
                            _startDate := CreateDateTime(_orderRecord."Requested Delivery Date", _truckerRecord."Requested Delivery Time");
                            _title := _truckerRecord.Employee + '  |' + _orderRecord."No." + ' / ' + _orderRecord."Sell-to Customer No." + ' / ' + _orderRecord."Sell-to Customer Name";
                            CurrPage.AgenadAddin.AddEvent(_startDate, _startDate, _truckerRecord.Order, _title, _truckerRecord.Employee, _employeeRecord.Color);
                        end;
                    end;
                end;
            until (_truckerRecord.Next() = 0);
        end;
    end;
}
