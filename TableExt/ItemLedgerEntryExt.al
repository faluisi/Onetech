tableextension 50026 ItemLedgerEntryExt extends "Item Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50002; "Document No Value Entry"; Code[20])
        {
            FieldClass = FlowField;


            CalcFormula = lookup("Purch. Rcpt. Header"."Order No." where("No." = FIELD("Document No.")));


        }
    }

    var
        myInt: Integer;
}

pageextension 50062 ItemLedgerEntriesExt extends "Item Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Value Entry Document No."; "Document No Value Entry")
            {

            }
        }
    }

}