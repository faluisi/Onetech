pageextension 50065 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {

        addbefore("Prepayment %")
        {
            field(PrepaymentAmount; PrepaymentAmount)
            {
                ApplicationArea = all;
                Caption = 'Prepayment Amount';
                trigger OnValidate()
                var
                    pl: Record "Purchase Line";
                    DocumentTotals: Codeunit "Document Totals";
                    TotalPurchLine: Record "Purchase Line";
                    VATAmount: Decimal;
                begin

                    pl.SETRANGE("Document Type", "Document Type");
                    pl.SETRANGE("Document No.", "No.");
                    IF pl.FINDFIRST THEN
                        DocumentTotals.CalculatePurchaseTotals(TotalPurchLine, VATAmount, pl);
                    VALIDATE("Prepayment %", PrepaymentAmount / TotalPurchLine."Line Amount" * 100);
                    CurrPage.UPDATE(FALSE);
                end;
            }
        }
        modify("Prepayment %")
        {
            trigger OnAfterValidate()
            var
                pl: Record "Purchase Line";
                DocumentTotals: Codeunit "Document Totals";
                TotalPurchLine: Record "Purchase Line";
                VATAmount: Decimal;
            begin
                pl.SETRANGE("Document Type", "Document Type");
                pl.SETRANGE("Document No.", "No.");
                IF pl.FINDFIRST THEN
                    DocumentTotals.CalculatePurchaseTotals(TotalPurchLine, VATAmount, pl);
                PrepaymentAmount := TotalPurchLine."Line Amount" * "Prepayment %" / 100;
            end;
        }


    }


    trigger OnAfterGetRecord()
    var
        pl: Record "Purchase Line";
        DocumentTotals: Codeunit "Document Totals";
        TotalPurchLine: Record "Purchase Line";
        VATAmount: Decimal;
    begin
        pl.SETRANGE("Document Type", "Document Type");
        pl.SETRANGE("Document No.", "No.");
        IF pl.FINDFIRST THEN
            DocumentTotals.CalculatePurchaseTotals(TotalPurchLine, VATAmount, pl);
        PrepaymentAmount := TotalPurchLine."Line Amount" * "Prepayment %" / 100;
    end;

    var
        PrepaymentAmount: decimal;

}
