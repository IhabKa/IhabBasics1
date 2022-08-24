/// <summary>
/// Report Ihab Items List (ID 50800).
/// </summary>
report 50800 "Ihab Items List"
{
    ApplicationArea = All;
    Caption = 'Ihab Items List';
    UsageCategory = Lists;
    DefaultLayout = RDLC;
    RDLCLayout = './IhabItemList.rdlc';
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
