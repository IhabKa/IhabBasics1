/// <summary>
/// PageExtension Posted Sales Invoice Ext (ID 50801) extends Record Posted Sales Invoice.
/// </summary>
pageextension 50824 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter(Cancelled)
        {
            field("Max Delivery Date2"; Rec."Max Delivery Date2")
            {
                Caption = 'Ihab Max Delivery Date';

            }
        }
    }
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
}
