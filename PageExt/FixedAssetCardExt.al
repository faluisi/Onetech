pageextension 50072 FixedAssetCardExtONETECH extends "Fixed Asset Card"
{
    layout
    {



        addafter(CustomerSiteTracking)
        {
            group(CustomerSite)
            {
                Caption = 'Customer - Site';

                group(Site)
                {

                    field(Location; Location)
                    {
                        Caption = 'Location';
                        Editable = false;
                        ApplicationArea = all;
                    }
                    field(Hall; Hall)
                    {
                        Caption = 'Hall';
                        Editable = false;
                        ApplicationArea = all;
                    }
                    field(Group; Group)
                    {
                        Caption = 'Group';
                        ApplicationArea = all;
                        Editable = false;
                    }
                    field("Hall Status"; "Hall Status")
                    {
                        Caption = 'Hall Status';
                        ApplicationArea = all;
                        Editable = false;
                    }
                    field("Operator Name"; "Operator Name")
                    {
                        Caption = 'Operator Name';
                        ApplicationArea = all;
                        Editable = false;
                    }
                    field("Business Name"; "Business Name")
                    {
                        Caption = 'Business Name';
                        ApplicationArea = all;
                        Editable = false;
                    }

                }
            }
        }
    }

}
