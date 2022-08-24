/// <summary>
/// TableExtension Sales Invoice Header Ext (ID 50801) extends Record Sales Invoice Header.
/// </summary>
tableextension 50802 "Sales Invoice Header Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50800; "Max Delivery Date2"; Date)
        {
            Caption = 'Ihab Max. Delivery Date';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
    }
}
