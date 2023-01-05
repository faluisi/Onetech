// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 PageExtension50100 extends "General Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field("Line No."; "Line No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Amount")
        {
            field("Amount LCY"; "Amount (LCY)")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
    }
}

pageextension 50101 PageExtension50101 extends "Cash Receipt Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field("Line No."; "Line No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Amount")
        {
            field("Amount LCY"; "Amount (LCY)")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
    }
}