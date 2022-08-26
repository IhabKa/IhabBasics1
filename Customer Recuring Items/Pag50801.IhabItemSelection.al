/// <summary>
/// Page Ihab Item Selection (ID 50801).
/// </summary>
page 50825 "Ihab Item Selection"
{
    Caption = 'Ihab Item Selection';
    PageType = Worksheet;
    SourceTable = Item;
    SourceTableTemporary = true;
    LinksAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies what you are selling.';
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    Caption = 'Check';
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example an item that is placed in quarantine.';
                }
            }
        }
    }
}
