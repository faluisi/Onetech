pageextension 50067 GeneralLedgerEntriesExtOne extends "General Ledger Entries"
{
    layout
    {

        addafter("External Document No.")
        {
            field(VendorCode; VendorCode)
            {
                ApplicationArea = All;
            }
            field(VendorName; VendorName)
            {
                ApplicationArea = All;
            }

        }
        addafter("Document Date")
        {
            field("System-Created Entry90050"; Rec."System-Created Entry")
            {
                ApplicationArea = All;
            }
            field(SystemCreatedAt63406; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
            }
            field(SystemCreatedBy51542; Rec.SystemCreatedBy)
            {
                ApplicationArea = All;
            }
        }
        modify("Additional-Currency Amount")
        {
            Visible = true;
        }
    }
    actions
    {
    }
    var
        VendorCode: code[20];
        VendorName: text[100];

    trigger OnAfterGetRecord()
    var
        purchheader: record "Purch. Inv. Header";
        purchcrheader: Record "Purch. Cr. Memo Hdr.";
    begin
        VendorCode := '';
        VendorName := '';
        if purchheader.Get("Document No.") then begin
            VendorCode := purchheader."Buy-from Vendor No.";
            VendorName := purchheader."Buy-from Vendor Name"
        end;
        if purchcrheader.Get("Document No.") then begin
            VendorCode := purchcrheader."Buy-from Vendor No.";
            VendorName := purchcrheader."Buy-from Vendor Name"
        end;
    end;
}
