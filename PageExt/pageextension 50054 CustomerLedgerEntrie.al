pageextension 50054 CustomerLedgerEntriesExtOne extends "Customer Ledger Entries"
{
    layout
    {

        addafter("External Document No.")
        {

            field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
    }
    var
}
