tableextension 50023 CustLedgerEntryExtONETECH extends "Cust. Ledger Entry"
{
    fields
    {
        field(50012; "Gen. Bus. Posting Group"; Code[20])
        {
            CalcFormula = Lookup(Customer."Gen. Bus. Posting Group" WHERE("No." = FIELD("Customer No.")));
            CaptionML = ENU = 'Gen. Bus. Posting Group',
                        SQI = 'Gr.Pergj.Biznesi';
            FieldClass = FlowField;
        }
    }
    var
}
