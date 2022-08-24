/// <summary>
/// Table 50820.
/// </summary>
table 50820 "Customer Recurring Item"
{
    Caption = 'Customer Recurring Item';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";

        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                Item: Record Item;

            begin
                if (Item.Get(Rec."Item No.")) then begin

                    Rec.Description := Item.Description;
                    Rec."Unit Of Measure Code" := Item."Sales Unit of Measure";
                end
            end;

            trigger OnLookup()
            var
                Item: Record Item;
                TempItem: Record Item temporary;
                CustomerRecurringItem: Record "Customer Recurring Item";
            begin
                if Item.FindSet() then begin
                    repeat
                        TempItem.Init();
                        TempItem."No." := Item."No.";
                        TempItem.Description := Item.Description;
                        if (CustomerRecurringItem.Get(Rec."Customer No.", Item."No.")) then
                            TempItem.Blocked := true;
                        TempItem.Insert();

                    until Item.Next() = 0
                end;
                if (TempItem.FindFirst()) then;
                if Page.RunModal(Page::"Ihab Item Selection", TempItem) = Action::LookupOK then
                    if (TempItem.FindSet()) then
                        repeat
                            if TempItem.Blocked then begin
                                if not CustomerRecurringItem.Get(Rec."Customer No.", TempItem."No.") then begin
                                    CustomerRecurringItem.Init();
                                    CustomerRecurringItem.Validate("Customer No.", Rec."Customer No.");
                                    CustomerRecurringItem.Validate("Item No.", TempItem."No.");
                                    CustomerRecurringItem.Insert();
                                end;
                            end else
                                if CustomerRecurringItem.Get(Rec."Customer No.", TempItem."No.") then
                                    CustomerRecurringItem.Delete();

                        until TempItem.Next() = 0;
            end;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;

        }
        field(4; "Unit Of Measure Code"; Code[20])
        {
            Caption = 'Unit Of Measure Code';
            DataClassification = ToBeClassified;
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("Item No."));
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Customer No.", "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Item No.", Description)
        { }

    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}