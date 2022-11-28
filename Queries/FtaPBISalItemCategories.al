query 6042365 FtaPBISalItemCategories
{
    APIGroup = 'B365';
    APIPublisher = 'FiftytwoAS';
    APIVersion = 'v1.0';
    EntityName = 'PBIQueries';
    EntitySetName = 'FtaPBISalItemCategory';
    QueryType = API;

    elements
    {
        dataitem(ItemCategory; "Item Category")
        {
            column(Code; Code)
            { }
            column(Description; Description)
            { }
            column(ParentCategory; "Parent Category")
            { }
        }
    }

    trigger OnBeforeOpen()
    var
        lCompanyInformation: Record "Company Information";
    begin
        if lCompanyInformation.Get() then
            if not lCompanyInformation.FtaPowerBIEnabled then SetRange(Code, '');
    end;
}
