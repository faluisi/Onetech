tableextension 50033 FixedAssetExtOnetech extends "Fixed Asset"
{
    fields
    {

        field(50010; "Location"; text[50])
        {


        }
        field(50011; "Hall"; text[50])
        {


        }
        field(50012; "Group"; Text[100])
        {
            Caption = 'Group Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = "Groups Cust";

        }
        field(50013; "Hall Status"; Text[50])
        {
            FieldClass = Normal;
        }


        field(50014; "Operator Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(50015; "Business Name"; Text[100])
        {
            FieldClass = Normal;
        }


    }

}
