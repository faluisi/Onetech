pageextension 50059 BankAccountListExtOneTech extends "Bank Account List"
{
    layout
    {

    }
    actions
    {
    }

    var

        usersetup: Record "User Setup";


    trigger OnOpenPage()
    begin
        if usersetup.Get(UserId) then begin
            if usersetup."Item Filter" <> '' then
                Rec.SetFilter("No.", usersetup."Bank Filter");

        end;


    end;
}