tableextension 50025 BankAccountExt extends "Bank Account"
{
    fields
    {
        // Add changes to table fields here
        field(50003; "Approval Batch Amount"; Decimal)
        {
            FieldClass = FlowField;


            CalcFormula = Sum("Gen. Journal Line"."Amount" where("Bal. Account No." = FIELD("No."),
             "Journal Batch Name" = filter('APPROVALS'),
             "Reason Code" = filter('APPROVED')));



        }

        field(50004; "Approval Batch Amount2"; Decimal)
        {
            FieldClass = FlowField;

            CalcFormula = Sum("Detailed Vendor Ledg. Entry".Amount where
             ("Default Bank Account" = field("No."), Open = filter(true), approved = filter(true)));
        }
    }

    var
        myInt: Integer;
}