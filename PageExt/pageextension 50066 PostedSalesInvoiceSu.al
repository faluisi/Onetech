pageextension 50066 PostedSalesInvSubExtOneTech extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("VAT Prod. Posting Group")
        {
            // field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            // {
            //     ApplicationArea = all;
            // }

        }
    }
    actions
    {
        addLast(processing)
        {
            action(ChangeGroup)
            {
                Caption = 'Change Posting Group';

                trigger OnAction();
                var
                    InputDialog: Page "Input Dialog Post Group";
                    GenBusGroup: Code[20];
                    GenItemgroup: Code[20];
                    search: Text;
                    change: Codeunit "Change Periode Date Sales";
                begin

                    CLEAR(InputDialog);
                    search := 'Item Posting Group';
                    InputDialog.SetValues(search, "Gen. Bus. Posting Group", "Gen. Prod. Posting Group");
                    IF ACTION::OK = InputDialog.RUNMODAL THEN BEGIN
                        InputDialog.GetValues(search, GenBusGroup, GenItemgroup);
                        change.ChangeSalesInvoicePostGroup(GenBusGroup, GenItemgroup, Rec);
                        CurrPage.UPDATE;
                    END;
                end;
            }
        }
    }
    var
        changedate: Codeunit "Change Periode Date Sales";

}
