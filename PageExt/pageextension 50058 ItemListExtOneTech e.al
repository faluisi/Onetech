pageextension 50058 ItemListExtOneTech extends "Item List"
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
                Rec.SetFilter("No.", usersetup."Item Filter");

        end;


    end;
}