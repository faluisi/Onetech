tableextension 50028 CustomerSiteExtOneTech extends "Customer-Site"
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
        field(50022; "SubGroup"; Text[100])
        {
            Caption = 'SubGroup Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = "SubGroups".SubGroup where("Group" = field("Group"));



        }

        field(50023; "Group"; Text[100])
        {
            Caption = 'Group Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = "Groups Cust";

        }
        field(50024; Status; Text[50])
        {
            FieldClass = Normal;
        }
        field(50025; "Current Status"; Text[50])
        {
            FieldClass = Normal;
        }
        field(50026; "Category"; Text[50])
        {
            FieldClass = Normal;
        }
        field(50027; "Operator Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(50028; "Business Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(50029; "Anniversary"; Date)
        {
            FieldClass = Normal;
        }
        field(50030; "Cardinal Points"; Text[50])
        {
            FieldClass = Normal;
        }
        field(50031; "Area"; Text[50])
        {
            FieldClass = Normal;
        }
        field(50032; "Region"; Text[50])
        {
            FieldClass = Normal;
        }
        field(50033; "Central Place"; Text[50])
        {
            FieldClass = Normal;
        }
        field(50034; "Municipal"; Text[50])
        {
            FieldClass = Normal;
        }
    }



}