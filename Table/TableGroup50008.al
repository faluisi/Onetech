table 50008 "Groups Cust"
{
    DataClassification = ToBeClassified;
    //LookupPageId = 50012;
    fields
    {
        field(50001; "Group"; Text[100])
        {
            Caption = 'Group Customer';
        }
        field(50002; "Group Name"; Text[100])
        { }

        field(50003; "SubGroup"; Text[100])

        {

            Caption = 'SubGroup Customer';

        }

        field(50004; "SubGroup Name"; Text[100])
        {
            // not used
        }
    }

    keys
    {
        key(PK; "Group")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Group", "Group Name")
        {
        }
    }
    trigger OnInsert()
    begin
        SubGroup := "Group";
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;


}


table 50009 "SubGroups"
{
    DataClassification = ToBeClassified;
    //LookupPageId = 50013;
    fields
    {
        field(50001; "Group"; Text[100])
        {
            Caption = 'Group Customer';
            TableRelation = "Groups Cust";
        }
        field(50002; "Group Name"; Text[100])
        { }

        field(50003; "SubGroup"; Text[100])

        {
            Caption = 'SubGroup Customer';
        }

        field(50004; "SubGroup Name"; Text[100])
        {

        }
    }

    keys
    {
        key(PK; "Group", "SubGroup")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Group", "Group Name", "SubGroup", "SubGroup Name")
        {
        }
    }
    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;


}