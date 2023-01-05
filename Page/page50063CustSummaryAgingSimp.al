page 50063 "Aged Accounts by Months"
{
    // version ONETECH

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Customer";

    layout
    {
        area(content)
        {
            field(StartDate; StartDate)
            {
                Caption = 'Balance as at';


                trigger OnValidate()
                begin

                    PopulateForm(StartDate);
                end;
            }
            field(FilterTotalDue; FilterTotalDue)
            {
                Caption = 'Exclude Zero Total Due Balances';

                trigger OnValidate()
                begin

                    ControlFilterTotalDue;
                end;
            }
            field("Global Dimension 1 Filter"; GlobalDimension1Filter)
            {
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

                trigger OnValidate()
                begin
                    PopulateForm(StartDate);
                end;
            }
            field("Global Dimension 2 Filter"; GlobalDimension2Filter)
            {
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

                trigger OnValidate()
                begin
                    PopulateForm(StartDate);
                end;
            }
            repeater(Group)
            {
                Editable = false;
                field("No."; "No.")
                {
                }
                field(Name; Name)
                {
                }

                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                { }
                field("Current Month"; "Current Month")
                {
                    BlankZero = true;
                }
                field("1 Month"; "1 Month")
                {
                    BlankZero = true;
                }
                field("2 Months"; "2 Months")
                {
                    BlankZero = true;
                }
                field("3 Months"; "3 Months")
                {
                    BlankZero = true;
                }
                field("4 Months"; "4 Months")
                {
                    BlankZero = true;
                }
                field("5 Months"; "5 Months")
                {
                    BlankZero = true;
                }
                field("6 Months"; "6 Months")
                {
                    BlankZero = true;
                }
                field("7 Months"; "7 Months")
                {
                    BlankZero = true;
                }
                field("8 Months"; "8 Months")
                {
                    BlankZero = true;
                }
                field("9 Months"; "9 Months")
                {
                    BlankZero = true;
                }
                field("10 Months"; "10 Months")
                {
                    BlankZero = true;
                }
                field("11 Months"; "11 Months")
                {
                    BlankZero = true;
                }
                field("12 Months"; "12 Months")
                {
                    BlankZero = true;
                }
                field("Amounts Not Due"; "Amounts Not Due")
                {
                    Caption = 'Amounts Not Due';
                }
                field("Total Balance"; "Current Month" + "1 Month" + "2 Months" + "3 Months" + "4 Months" + "5 Months" + "6 Months" + "7 Months" + "8 Months" + "9 Months" + "10 Months" + "11 Months" + "12 Months")
                {
                    Caption = 'Total Balance';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin


        FilterTotalDue := TRUE;

        IF (StartDate = 0D) THEN
            StartDate := TODAY;

        PopulateForm(StartDate);

    end;

    var
        StartDate: Date;
        Period1: Date;
        Period2: Date;
        Period3: Date;
        Period4: Date;
        Period5: Date;
        Period6: Date;
        YTD: Date;
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        CustLedgEntry: Record "Cust. Ledger Entry";
        FilterTotalDue: Boolean;
        Text000: Label 'Balance as at Date must not be blank';
        Period0: Date;
        Period7: Date;
        Period68: Date;
        GlobalDimension1Filter: Text;
        GlobalDimension2Filter: Text;

        Period8: Date;
        Period9: Date;
        Period10: Date;
        Period11: Date;
        Period12: Date;
        Period13: Date;

    procedure PopulateForm(StartDate: Date)
    begin
        //--The main function which calculates the aging bands of the form




        //--To Clear Customer Filters prior processing
        RESET;

        //--Processes the aging flowfilters and so calculates the Customer table flowfields accordingly

        //Used to calculate the Total Due Amount
        SETRANGE("Date Filter", 0D, StartDate);

        //Future Date Filter
        //Period7 := CALCDATE('<+1D+CM>',StartDate);
        Period0 := CALCDATE('<CM>', StartDate);
        Period7 := CALCDATE('<+1D>', StartDate);
        SETFILTER("Future Date Filter", '>%1', Period0);


        //Used to calculate the Current Month entries (from 1st day of Month to Today)
        Period1 := CALCDATE('<-CM>', StartDate);
        SETRANGE("0D Date Filter", Period1, Period0);

        //+1 Months (Whole Month)
        Period2 := CALCDATE('<-1M-CM>', Period1);
        SETRANGE("30D Date Filter", Period2, Period1 - 1);

        //+2 Months (Whole Month)
        Period3 := CALCDATE('<-1M-CM>', Period2);
        SETRANGE("60D Date Filter", Period3, Period2 - 1);

        //+3 Months (Whole Month)
        Period4 := CALCDATE('<-1M-CM>', Period3);
        SETRANGE("90D Date Filter", Period4, Period3 - 1);

        //+4 Months (Whole Month)
        Period5 := CALCDATE('<-1M-CM>', Period4);
        SETRANGE("120D Date Filter", Period5, Period4 - 1);

        //+5 Months (Whole Month)
        Period6 := CALCDATE('<-1M-CM>', Period5);
        SETRANGE("150D Date Filter", Period6, Period5 - 1);

        //+6 Months (Whole Month)
        Period7 := CALCDATE('<-1M-CM>', Period6);
        SETRANGE("180D Date Filter", Period7, Period6 - 1);

        //+7 Months (Whole Month)
        Period8 := CALCDATE('<-1M-CM>', Period7);
        SETRANGE("210D Date Filter", Period8, Period7 - 1);

        //+8 Months (Whole Month)
        Period9 := CALCDATE('<-1M-CM>', Period8);
        SETRANGE("240D Date Filter", Period9, Period8 - 1);

        //+9 Months (Whole Month)
        Period10 := CALCDATE('<-1M-CM>', Period9);
        SETRANGE("270D Date Filter", Period10, Period9 - 1);

        //+10 Months (Whole Month)
        Period11 := CALCDATE('<-1M-CM>', Period10);
        SETRANGE("300D Date Filter", Period11, Period10 - 1);

        //+11 Months (Whole Month)
        Period12 := CALCDATE('<-1M-CM>', Period11);
        SETRANGE("330D Date Filter", Period12, Period11 - 1);

        //Entries dated more than 12 Months
        SETRANGE("360D Date Filter", 0D, Period12 - 1);

        ////SETRANGE("NotDue Date Filter",StartDate,31129999D);

        //  Change de YTD with the first day of the year
        // Calculates the Year-To-Date Date
        // YTD := CALCDATE('<-1Y>',StartDate);
        //SETRANGE("1Y Date Filter", DMY2DATE(1, 1, DATE2DMY(StartDate, 3)), StartDate);

        //SettingFilter

        SETFILTER("Global Dimension 1 Filter", GlobalDimension1Filter);
        SETFILTER("Global Dimension 2 Filter", GlobalDimension2Filter);

        ControlFilterTotalDue;
    end;

    procedure CalculateDebtorsDays() Days: Decimal
    var
        i: Decimal;
    begin
        //--Calculates the debtors day ratio and populates the field

        //IF (("Total Due" = 0) OR ("YTD Sales Incl. VAT" = 0)) THEN
        //    i := 0
        //ELSE
        //    i := (("Total Due" / "YTD Sales Incl. VAT") * 365);

        //Negative figures are rounded to 0 days
        IF (i < 0) THEN
            Days := 0
        ELSE
            Days := i;

        EXIT(Days);
    end;

    procedure CalculateNumberOfColumns() NumberOfColumns: Integer
    var
        i: Decimal;
        PaymentTerms: Record "Payment Terms";
        DateExpr: Text[8];
        Text000: Label '''Due Date Calculation'' field is missing for some Payment Terms Codes in the Payment Terms table. You must fill in the ''Due Date Calculation'' field before accessing this form.';
        Num: Integer;
    begin
        //--This function is called from the function CalculateCurrentNotDueAmt()

        //If payment terms code is blank then the NumberOfColumns returned is 0, thus everyting is overdue.
        //If the payment terms code is filled in then date calculation (eg. +30D) is formatted to process
        //the NumberofColumns returned. The amount returned means the number of periods which are not overdue.
        //Figures are rounded

        IF ("Payment Terms Code" = '') THEN BEGIN
            NumberOfColumns := 0;
        END
        ELSE BEGIN
            IF PaymentTerms.GET("Payment Terms Code") THEN BEGIN
                CLEAR(DateExpr);
                DateExpr := FORMAT(PaymentTerms."Due Date Calculation");
                IF (DateExpr <> '') THEN BEGIN
                    //To cater for both Day and Month setup
                    IF (STRPOS(DateExpr, 'D') <> 0) THEN BEGIN
                        CLEAR(Num);
                        DateExpr := DELCHR(DateExpr, '<>', '+D');

                        Num := ControlEvaluate(DateExpr);

                        NumberOfColumns := ROUND((Num / 30), 1, '='); //30 is the lowest day denominator
                    END
                    ELSE BEGIN
                        CLEAR(Num);
                        DateExpr := DELCHR(DateExpr, '<>', '+M');

                        Num := ControlEvaluate(DateExpr);

                        NumberOfColumns := ROUND((Num / 1), 1, '='); //1 is the lowest month denominator
                    END;
                END
                ELSE
                    ERROR(Text000);
            END;
        END;
    end;

    procedure CalculateCurrentNotDueAmt() Amt: Decimal
    var
        i: Integer;
        Periods: Integer;
    begin
        //--Calculates the Current Not Due Amount. Uses the CalculateCurrentNotDueDate() Function to obtain the number of columns.

        //Aging Columns are summed according to the number returned from the CalculateNumberOfColumns Function
        CLEAR(Amt);
        CASE CalculateNumberOfColumns OF

            0:
                Amt := 0;

            1:
                Amt := "Current Month";

            2:
                Amt := "Current Month" + "1 Month";

            3:
                Amt := "Current Month" + "1 Month" + "2 Months";

            4:
                Amt := "Current Month" + "1 Month" + "2 Months" + "3 Months";

            5:
                Amt := "Current Month" + "1 Month" + "2 Months" + "3 Months" + "4 Months";

            6:
                Amt := "Current Month" + "1 Month" + "2 Months" + "3 Months" + "4 Months" + "5 Months";

            7:
                Amt := "Current Month" + "1 Month" + "2 Months" + "3 Months" + "4 Months" + "5 Months" + "6 Months";
        END;

        EXIT(Amt);
    end;

    procedure ControlEvaluate(DateExpr: Text[8]): Integer
    var
        Num: Integer;
    begin

        IF NOT EVALUATE(Num, DateExpr) THEN
            Num := 0;

        EXIT(Num);
    end;

    procedure ControlFilterTotalDue()
    begin

        // If Checkbox is ticked then do not show records with zero Total Due Balances
        //IF FilterTotalDue = TRUE THEN
        //    SETFILTER("Total Due", '<>%1', 0)
        //ELSE
        //   SETRANGE("Total Due");

        CurrPage.UPDATE(FALSE);

    end;

    procedure FirstYear()
    begin
    end;
}

