/// <summary>
/// PageExtension Ihab Cutomer Preferred Items (ID 50822) extends Record MyTargetPage.
/// </summary>
pageextension 50822 "Ihab Customer Preferred Items" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore("Item References")
        {
            action("Ihab Customer Preferred Items")
            {
                Caption = 'Ihab Customer Preferred Items';
                ApplicationArea = all;
                Promoted = true;
                Image = AbsenceCalendar;
                RunObject = Page "Customer Recurring Items";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }

    var
        myInt: Integer;
}