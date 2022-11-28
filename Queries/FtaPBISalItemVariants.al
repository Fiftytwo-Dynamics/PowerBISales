query 6042366 FtaPBISalItemVariants
{
    APIGroup = 'B365';
    APIPublisher = 'FiftytwoAS';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBISalItemVariant';
    QueryType = API;

    elements
    {
        dataitem(ItemVariant; "Item Variant")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(Code; Code)
            {
            }
            column(Description; Description)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then SetRange(ItemNo, '');
    end;
}
