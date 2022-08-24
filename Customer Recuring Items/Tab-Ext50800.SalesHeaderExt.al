/// <summary>
/// TableExtension Sales Header Ext (ID 50800) extends Record Sales Header.
/// </summary>
tableextension 50800 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50800; "Max Delivery Date1"; Date)
        {
            Caption = 'Max Delivery Date';
            DataClassification = ToBeClassified;
        }
    }
}
