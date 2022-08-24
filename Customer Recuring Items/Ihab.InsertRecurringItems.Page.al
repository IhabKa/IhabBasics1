/// <summary>
/// PageExtension Ihab Insert Recurring Items (ID 50823) extends Record MyTargetPage.
/// </summary>
pageextension 50823 "Ihab Insert Recurring Items" extends "Sales Order"
{
    layout
    {
        addafter("Due Date")
        {
            field("Max Delivery Date1"; Rec."Max Delivery Date1")
            {
                ApplicationArea = All;
                Caption = 'Ihab Max. Delivery Date';
            }
        }
    }

    actions
    {
        addafter(CalculateInvoiceDiscount)
        {
            action("Ihab Insert Recurring Items")
            {
                Caption = 'Ihab Insert Recurring Items';
                ApplicationArea = all;
                Promoted = true;
                Image = Insert;

                trigger OnAction()
                var
                    CustemorRecurringItems: Record "Customer Recurring Item";
                    LastLineNb: Integer;

                begin
                    GetLastLineNo(LastLineNb);
                    CustemorRecurringItems.SetRange("Customer No.", Rec."Sell-to Customer No.");
                    if CustemorRecurringItems.FindSet() then
                        repeat
                            InsertSalesLine(LastLineNb, CustemorRecurringItems);
                        until CustemorRecurringItems.Next() = 0;
                end;

            }
        }
        addafter("Ihab Insert Recurring Items")
        {
            action(name)
            {
                Caption = 'GetMaxDeliveryDate';
                ApplicationArea = All;
                Image = Action;
                trigger OnAction()
                begin
                    Message(Format(Rec."Max Delivery Date1"));
                end;
            }
        }


    }
    local procedure InsertSalesLine(var LastLineNb: Integer; CustemorRecurringItems: Record "Customer Recurring Item")
    var
        SalesLine: Record "Sales Line";
    begin
        LastLineNb += 10000;
        SalesLine.Init();
        SalesLine."Document Type" := Rec."Document Type";
        SalesLine."Document No." := Rec."No.";
        SalesLine."Line No." := LastLineNb;
        SalesLine.Insert(true);
        SalesLine.Validate(Type, SalesLine.Type::Item);
        SalesLine.Validate("No.", CustemorRecurringItems."Item No.");
        SalesLine.Validate(Quantity, CustemorRecurringItems.Quantity);
        SalesLine.Validate("Unit of Measure Code", CustemorRecurringItems."Unit Of Measure Code");
        SalesLine.Validate(Description, CustemorRecurringItems.Description);
        SalesLine.Modify(true);
    end;

    local procedure GetLastLineNo(var LastLineNb: Integer)
    SalesLine: Record "Sales Line";

    begin
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        if SalesLine.FindLast() then
            LastlineNb := SalesLine."Line No.";
    end;

    local procedure FillExcelBuffer()
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
    begin

    end;

    var
        myInt: Integer;
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
}