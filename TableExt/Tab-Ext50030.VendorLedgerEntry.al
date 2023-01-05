tableextension 50030 VendorLedgerEntry extends "Vendor Ledger Entry"
{
    fields
    {

        field(50025; "Default Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Default Bank Account';

            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."Default Bank Account" where("No." = field("Vendor No.")));
        }
    }
}
