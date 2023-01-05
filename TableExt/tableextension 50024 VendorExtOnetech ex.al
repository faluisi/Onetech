tableextension 50024 VendorExtOnetech extends Vendor
{

    fields
    {
        field(50002; "Default Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";


        }
        field(50003; "Print Name on Check"; Text[100])
        {
            Caption = 'Print Name on Check';
        }
    }
    trigger OnAfterModify()
    begin
        TestField("Currency Code");
    end;
}