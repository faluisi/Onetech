tableextension 50020 SalesRecSetupExtOnetech extends "Sales & Receivables Setup"
{
    fields
    {
        field(50002; "Period Start End mandatory"; Boolean)
        {

        }
    }

    var

}
pageextension 50191 SalesRecSetupExtOnetechpage extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Discount Posting")
        {
            field("Period Start End mandatory"; "Period Start End mandatory")
            {
                ApplicationArea = All;
                Caption = 'Period Start End mandatory';
                ToolTip = 'Determine whether to make fields Period Start, Period End mandatory before posting';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}