pageextension 50068 PaymentJournalExtOnetech extends "Payment Journal"
{
    layout
    {
        modify("Reason Code")
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
            begin
                Publisher.OnReasonCodeChanged(CurrPage.Banks.Page);
            end;
        }

        modify("Amount")
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
            begin
                Publisher.OnReasonCodeChanged(CurrPage.Banks.Page);
            end;
        }
        addlast(factboxes)
        {
            part("Banks"; "PaymentJournal Bank List Part")
            {
                ApplicationArea = Basic, Suite;

            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action("Suggest Vendor Payments New")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Suggest Vendor Payments New';
                Image = "Vendor";

                trigger OnAction()
                var
                    SuggestVendorPayments: Report "Suggest Vendor Payments New";
                begin
                    Clear(SuggestVendorPayments);
                    SuggestVendorPayments.SetGenJnlLine(Rec);
                    SuggestVendorPayments.RunModal;
                end;
            }
        }

    }

}