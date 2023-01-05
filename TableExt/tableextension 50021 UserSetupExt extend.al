tableextension 50021 UserSetupExtOneTech extends "User Setup"
{
    fields
    {
        field(50020; "Bank Filter"; text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(50021; "Item Filter"; text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(50022; "Approve Finance"; boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    var

}